part of 'wallpaper_bloc.dart';

enum WallpaperStatus { initial, loading, success, error }

enum DownloadStatus { initial, loading, success, error }

enum BackgroundStatus { initial, loading, success, error }

class WallpaperState extends Equatable {
  const WallpaperState(
      {this.status = WallpaperStatus.initial,
      this.error = '',
      this.response,
      this.photo,
      this.selectOption = 0,
      this.showElements = true,
      this.downloadStatus = DownloadStatus.initial,
      this.backgroundStatus = BackgroundStatus.initial});
  final WallpaperStatus status;
  final String error;
  final bool showElements;
  final Request? response;
  final Photo? photo;
  final DownloadStatus downloadStatus;
  final BackgroundStatus backgroundStatus;
  final int selectOption;

  factory WallpaperState.intialState() => const WallpaperState();

  WallpaperState copyWith(
          {WallpaperStatus? status,
          String? error,
          bool? showElements,
          Request? response,
          DownloadStatus? downloadStatus,
          int? selectOption,
          Photo? photo,
          BackgroundStatus? backgroundStatus}) =>
      WallpaperState(
          error: error ?? this.error,
          status: status ?? this.status,
          showElements: showElements ?? this.showElements,
          selectOption: selectOption ?? this.selectOption,
          downloadStatus: downloadStatus ?? this.downloadStatus,
          response: response ?? this.response,
          backgroundStatus: backgroundStatus ?? this.backgroundStatus,
          photo: photo ?? this.photo);

  @override
  List<Object> get props => [
        status,
        error,
        response ?? '',
        photo ?? '',
        downloadStatus,
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
}
