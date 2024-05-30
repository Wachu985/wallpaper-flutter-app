import 'dart:async';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/src_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/is_favorite.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/load_favorites.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/toogle_favorite.dart';

import '../../domain/entities/photo.dart';
import '../../domain/usescase/download_image.dart';
import '../../domain/usescase/get_curated.dart';
import '../../domain/usescase/search_photo.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  final GetCurated _getCurated;
  final SearchPhoto _searchPhoto;
  final DownloadImage _downloadImage;
  final IsFavorite _isFavorite;
  final ToogleFavorite _toogleFavorite;
  final LoadFavorites _loadFavorites;
  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;
  double _lastOffset = 0.0;

  void init() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_lastOffset > _scrollController.offset || _lastOffset < 0) {
        add(WallpaperEvent.changeShow(showElements: true));
      } else {
        add(WallpaperEvent.changeShow(showElements: false));
      }
      _lastOffset = _scrollController.offset;
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 500 &&
          !state.isILoading) {
        add(WallpaperEvent.chargeCurated(page: state.pageShow + 1));
      }
    });
  }

  WallpaperBloc({
    required GetCurated getCurated,
    required SearchPhoto searchPhoto,
    required DownloadImage downloadImage,
    required IsFavorite isFavorite,
    required ToogleFavorite toogleFavorite,
    required LoadFavorites loadFavorites,
  })  : _getCurated = getCurated,
        _downloadImage = downloadImage,
        _searchPhoto = searchPhoto,
        _isFavorite = isFavorite,
        _toogleFavorite = toogleFavorite,
        _loadFavorites = loadFavorites,
        super(WallpaperState.intialState()) {
    on<_ChargeCurated>(_chargeCurated);
    on<_SearchEvent>(_searchEvent);
    on<_ChangeOption>(_changeOption);
    on<_ChangePage>(_changePage);
    on<_DownloadImageEvent>(_downloadImageEvent);
    on<_SetWallpaperEvent>(_setWallpaperEvent);
    on<_InitialAllEvent>(_initialAllEvent);
    on<_ChangeShow>(_changeShow);
    on<_LoadFavorites>(_loadFavoritesEvent);
    on<_ToogleFavorite>(_toogleFavoriteEvent);
  }

  FutureOr<void> _chargeCurated(
      _ChargeCurated event, Emitter<WallpaperState> emit) async {
    if (event.page == 1) {
      emit(state.copyWith(status: WallpaperStatus.loading));
    } else {
      emit(state.copyWith(infinityStatus: InfinityStatus.loading));
    }
    final response = await _getCurated(page: event.page);
    response.fold(
        (e) => emit(
              state.copyWith(
                error: e.message,
                status: WallpaperStatus.error,
                pageShow: 1,
                infinityStatus: InfinityStatus.error,
              ),
            ),
        (request) => emit(state.copyWith(
                response: [
                  if (event.page != 1) ...state.response,
                  ...request.photos
                ],
                pageShow: event.page,
                status: WallpaperStatus.success,
                infinityStatus: InfinityStatus.success)));
  }

  FutureOr<void> _searchEvent(
      _SearchEvent event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(status: WallpaperStatus.loading));
    final response = await _searchPhoto(search: event.search);
    response.fold(
        (e) => emit(state.copyWith(
            error: e.message,
            status: WallpaperStatus.error,
            pageShow: 1)), (request) {
      if (request.photos.isEmpty) {
        emit(state.copyWith(
          error: S.current.imagesNotFound,
          status: WallpaperStatus.error,
          pageShow: 1,
        ));
      } else {
        emit(state.copyWith(
            response: request.photos,
            status: WallpaperStatus.success,
            pageShow: 1));
      }
    });
  }

  FutureOr<void> _changePage(_ChangePage event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(photo: event.photo));
  }

  FutureOr<void> _downloadImageEvent(
      _DownloadImageEvent event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(downloadStatus: DownloadStatus.loading));
    if (await getStoragePermission()) {
      final response = await _downloadImage(url: event.url);
      response.fold(
        (error) => emit(state.copyWith(
            downloadStatus: DownloadStatus.error, error: error.message)),
        (success) => emit(
          state.copyWith(
            downloadStatus: DownloadStatus.success,
            favoriteStatus: FavoriteStatus.success,
          ),
        ),
      );
    } else {
      emit(state.copyWith(
          backgroundStatus: BackgroundStatus.error,
          error: S.current.notDownloadPermisions));
    }
  }

  FutureOr<void> _setWallpaperEvent(
      _SetWallpaperEvent event, Emitter<WallpaperState> emit) async {
    try {
      emit(state.copyWith(backgroundStatus: BackgroundStatus.loading));
      if (await getStoragePermission()) {
        final response = await _downloadImage(url: event.url);
        String? value;
        response.fold(
            (error) => emit(state.copyWith(
                downloadStatus: DownloadStatus.error, error: error.message)),
            (success) => value = success);

        if (await AsyncWallpaper.setWallpaperFromFile(
          filePath: value!,
          wallpaperLocation: state.selectOption + 1,
          goToHome: true,
        ).timeout(const Duration(seconds: 15))) {
          emit(state.copyWith(backgroundStatus: BackgroundStatus.success));
        } else {
          emit(state.copyWith(
              backgroundStatus: BackgroundStatus.error,
              error: S.current.errorBloc1));
        }
      } else {
        emit(state.copyWith(
            backgroundStatus: BackgroundStatus.error,
            error: S.current.errorBloc2));
      }
    } on PlatformException {
      emit(state.copyWith(
          backgroundStatus: BackgroundStatus.error,
          error: S.current.errorBloc3));
    } catch (e) {
      emit(state.copyWith(
        backgroundStatus: BackgroundStatus.error,
        error: S.current.errorBloc3,
      ));
    }
  }

  FutureOr<void> _changeOption(
      _ChangeOption event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(selectOption: event.option));
  }

  FutureOr<void> _initialAllEvent(
      _InitialAllEvent event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(
      backgroundStatus: BackgroundStatus.initial,
      downloadStatus: DownloadStatus.initial,
      // favoriteStatus: FavoriteStatus.initial,
    ));
  }

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }

  FutureOr<void> _changeShow(_ChangeShow event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(showElements: event.showElements));
  }

  FutureOr<void> _loadFavoritesEvent(
      _LoadFavorites event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(favoriteStatus: FavoriteStatus.loading));

    final response = await _loadFavorites();
    response.fold(
        (error) => emit(state.copyWith(
            favoriteStatus: FavoriteStatus.error, error: error.message)),
        (success) => emit(state.copyWith(
            favoriteStatus: FavoriteStatus.success, listFavorites: success)));
  }

  FutureOr<void> _toogleFavoriteEvent(
      _ToogleFavorite event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(favoriteStatus: FavoriteStatus.loading));

    final response = await _toogleFavorite(
        photo: PhotoModel(
      alt: event.photo.alt,
      avgColor: event.photo.avgColor,
      height: event.photo.height,
      id: event.photo.id,
      liked: event.photo.liked,
      photographer: event.photo.photographer,
      photographerId: event.photo.photographerId,
      photographerUrl: event.photo.photographerUrl,
      src: SrcModel(
        landscape: event.photo.src.landscape,
        large2X: event.photo.src.large2X,
        large: event.photo.src.large,
        medium: event.photo.src.medium,
        original: event.photo.src.original,
        portrait: event.photo.src.portrait,
        small: event.photo.src.small,
        tiny: event.photo.src.tiny,
      ),
      url: event.photo.url,
      width: event.photo.width,
    ));
    response.fold(
        (error) => emit(state.copyWith(
            favoriteStatus: FavoriteStatus.error, error: error.message)),
        (success) =>
            emit(state.copyWith(favoriteStatus: FavoriteStatus.success)));
    add(WallpaperEvent.loadFavorites());
  }

  Future<bool> isFavorite(int photoId) async {
    final response = await _isFavorite(photoId: photoId);
    return response.fold((error) => false, (success) => success);
  }

  Future<bool> getStoragePermission() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    if (android.version.sdkInt < 33) {
      if (await Permission.storage.request().isGranted) {
        return true;
      } else if (await Permission.storage.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.audio.request().isDenied) {
        return false;
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        return true;
      } else if (await Permission.photos.request().isPermanentlyDenied) {
        await openAppSettings();
      } else if (await Permission.photos.request().isDenied) {
        return false;
      }
    }
    return false;
  }
}
