part of 'wallpaper_bloc.dart';

enum WallpaperStatus { initial, loading, success, error }

enum DownloadStatus { initial, loading, success, error }

enum BackgroundStatus { initial, loading, success, error }

enum InfinityStatus { initial, loading, success, error }

enum FavoriteStatus { initial, loading, success, error }

class WallpaperState extends Equatable {
  const WallpaperState(
      {this.status = WallpaperStatus.initial,
      this.error = '',
      this.response = const [],
      this.listFavorites = const [],
      this.favoriteStatus = FavoriteStatus.initial,
      this.infinityStatus = InfinityStatus.initial,
      this.photo,
      this.pageShow = 1,
      this.selectOption = 0,
      this.showElements = true,
      this.downloadStatus = DownloadStatus.initial,
      this.backgroundStatus = BackgroundStatus.initial});
  final WallpaperStatus status;
  final String error;
  final bool showElements;
  final List<Photo> response;
  final InfinityStatus infinityStatus;
  final Photo? photo;
  final int pageShow;
  final DownloadStatus downloadStatus;
  final BackgroundStatus backgroundStatus;
  final FavoriteStatus favoriteStatus;
  final List<Photo> listFavorites;
  final int selectOption;

  factory WallpaperState.intialState() => const WallpaperState();

  WallpaperState copyWith(
          {WallpaperStatus? status,
          String? error,
          bool? showElements,
          FavoriteStatus? favoriteStatus,
          List<Photo>? response,
          DownloadStatus? downloadStatus,
          int? selectOption,
          InfinityStatus? infinityStatus,
          int? pageShow,
          List<Photo>? listFavorites,
          Photo? photo,
          BackgroundStatus? backgroundStatus}) =>
      WallpaperState(
          error: error ?? this.error,
          status: status ?? this.status,
          infinityStatus: infinityStatus ?? this.infinityStatus,
          showElements: showElements ?? this.showElements,
          selectOption: selectOption ?? this.selectOption,
          downloadStatus: downloadStatus ?? this.downloadStatus,
          favoriteStatus: favoriteStatus ?? this.favoriteStatus,
          listFavorites: listFavorites ?? this.listFavorites,
          response: response ?? this.response,
          pageShow: pageShow ?? this.pageShow,
          backgroundStatus: backgroundStatus ?? this.backgroundStatus,
          photo: photo ?? this.photo);

  @override
  List<Object?> get props => [
        status,
        error,
        response,
        photo,
        favoriteStatus,
        pageShow,
        downloadStatus,
        listFavorites,
        infinityStatus,
        backgroundStatus,
        selectOption,
        showElements
      ];
}

extension WallpaperStateExtension on WallpaperState {
  bool get isLoading => status == WallpaperStatus.loading;
  bool get isSuccess => status == WallpaperStatus.success;
  bool get isError => status == WallpaperStatus.error;

  bool get isDownloading => downloadStatus == DownloadStatus.loading;
  bool get isDownload => downloadStatus == DownloadStatus.success;
  bool get isDError => downloadStatus == DownloadStatus.error;

  bool get isBLoading => backgroundStatus == BackgroundStatus.loading;
  bool get isBSuccess => backgroundStatus == BackgroundStatus.success;
  bool get isBError => backgroundStatus == BackgroundStatus.error;

  bool get isFLoading => favoriteStatus == FavoriteStatus.loading;
  bool get isFSuccess => favoriteStatus == FavoriteStatus.success;
  bool get isFError => favoriteStatus == FavoriteStatus.error;
  bool get notFavorites => listFavorites.isEmpty;

  bool get isILoading => infinityStatus == InfinityStatus.loading;
  bool get isISuccess => infinityStatus == InfinityStatus.success;
  bool get isIError => infinityStatus == InfinityStatus.error;
}
