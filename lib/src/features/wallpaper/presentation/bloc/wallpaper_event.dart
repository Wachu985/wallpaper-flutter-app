part of 'wallpaper_bloc.dart';

abstract class WallpaperEvent {
  factory WallpaperEvent.chargeCurated({int page = 1}) => _ChargeCurated(page);
  factory WallpaperEvent.initialAllEvent() => const _InitialAllEvent();
  factory WallpaperEvent.changeShow({required bool showElements}) =>
      _ChangeShow(showElements: showElements);
  factory WallpaperEvent.downloadImage({required String url}) =>
      _DownloadImageEvent(url: url);
  factory WallpaperEvent.setWallpaperEvent({required String url}) =>
      _SetWallpaperEvent(url: url);
  factory WallpaperEvent.changePage({required Photo photo}) =>
      _ChangePage(photo: photo);
  factory WallpaperEvent.searchEvent({required String search}) =>
      _SearchEvent(search: search);
  factory WallpaperEvent.changeOption({required int option}) =>
      _ChangeOption(option: option);

  factory WallpaperEvent.loadFavorites() => const _LoadFavorites();
  factory WallpaperEvent.toogleFavorite({required Photo photo}) =>
      _ToogleFavorite(photo: photo);
}

class _ChargeCurated implements WallpaperEvent {
  final int page;
  const _ChargeCurated(this.page);
}

class _InitialAllEvent implements WallpaperEvent {
  const _InitialAllEvent();
}

class _SearchEvent implements WallpaperEvent {
  const _SearchEvent({required this.search});
  final String search;
}

class _ChangePage implements WallpaperEvent {
  const _ChangePage({required this.photo});
  final Photo photo;
}

class _DownloadImageEvent implements WallpaperEvent {
  const _DownloadImageEvent({required this.url});
  final String url;
}

class _SetWallpaperEvent implements WallpaperEvent {
  const _SetWallpaperEvent({required this.url});
  final String url;
}

class _ChangeOption implements WallpaperEvent {
  const _ChangeOption({required this.option});
  final int option;
}

class _ChangeShow implements WallpaperEvent {
  const _ChangeShow({required this.showElements});
  final bool showElements;
}

class _LoadFavorites implements WallpaperEvent {
  const _LoadFavorites();
}

class _ToogleFavorite implements WallpaperEvent {
  final Photo photo;
  const _ToogleFavorite({required this.photo});
}
