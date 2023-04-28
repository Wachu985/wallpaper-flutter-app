import 'dart:async';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/photo.dart';
import '../../domain/entities/request.dart';
import '../../domain/usescase/download_image.dart';
import '../../domain/usescase/get_curated.dart';
import '../../domain/usescase/search_photo.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  final GetCurated _getCurated;
  final SearchPhoto _searchPhoto;
  final DownloadImage _downloadImage;
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
    });
  }

  WallpaperBloc(
      {required GetCurated getCurated,
      required SearchPhoto searchPhoto,
      required DownloadImage downloadImage})
      : _getCurated = getCurated,
        _downloadImage = downloadImage,
        _searchPhoto = searchPhoto,
        super(WallpaperState.intialState()) {
    on<_ChargeCurated>(_chargeCurated);
    on<_SearchEvent>(_searchEvent);
    on<_ChangeOption>(_changeOption);
    on<_ChangePage>(_changePage);
    on<_DownloadImageEvent>(_downloadImageEvent);
    on<_SetWallpaperEvent>(_setWallpaperEvent);
    on<_InitialAllEvent>(_initialAllEvent);
    on<_ChangeShow>(_changeShow);
  }

  FutureOr<void> _chargeCurated(
      _ChargeCurated event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(status: WallpaperStatus.loading));
    final response = await _getCurated();
    response.fold(
        (e) => emit(
            state.copyWith(error: e.message, status: WallpaperStatus.error)),
        (request) => emit(state.copyWith(
            response: request, status: WallpaperStatus.success)));
  }

  FutureOr<void> _searchEvent(
      _SearchEvent event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(status: WallpaperStatus.loading));
    final response = await _searchPhoto(search: event.search);
    response.fold(
        (e) => emit(
            state.copyWith(error: e.message, status: WallpaperStatus.error)),
        (request) {
      if (request.photos.isEmpty) {
        emit(state.copyWith(
            error: 'No se Encontraron Imagenes',
            status: WallpaperStatus.error));
      } else {
        emit(
            state.copyWith(response: request, status: WallpaperStatus.success));
      }
    });
  }

  FutureOr<void> _changePage(_ChangePage event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(photo: event.photo));
  }

  FutureOr<void> _downloadImageEvent(
      _DownloadImageEvent event, Emitter<WallpaperState> emit) async {
    emit(state.copyWith(downloadStatus: DownloadStatus.loading));
    if (await Permission.storage.request().isGranted) {
      final response = await _downloadImage(url: event.url);
      response.fold(
          (error) => emit(state.copyWith(
              downloadStatus: DownloadStatus.error, error: error.message)),
          (success) =>
              emit(state.copyWith(downloadStatus: DownloadStatus.success)));
    } else {
      emit(state.copyWith(
          backgroundStatus: BackgroundStatus.error,
          error: 'Error de Permisos'));
    }
  }

  FutureOr<void> _setWallpaperEvent(
      _SetWallpaperEvent event, Emitter<WallpaperState> emit) async {
    try {
      emit(state.copyWith(backgroundStatus: BackgroundStatus.loading));
      if (await Permission.storage.request().isGranted) {
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
              error: 'Error al establecer Fondo de Pantalla'));
        }
      } else {
        emit(state.copyWith(
            backgroundStatus: BackgroundStatus.error,
            error: 'Error de Permisos'));
      }
    } on PlatformException {
      emit(state.copyWith(
          backgroundStatus: BackgroundStatus.error,
          error: 'Error al establecer Fondo de Pantalla'));
    } catch (e) {
      emit(state.copyWith(
          backgroundStatus: BackgroundStatus.error,
          error: 'Error al establecer Fondo de Pantalla'));
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
        downloadStatus: DownloadStatus.initial));
  }

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }

  FutureOr<void> _changeShow(_ChangeShow event, Emitter<WallpaperState> emit) {
    emit(state.copyWith(showElements: event.showElements));
  }
}
