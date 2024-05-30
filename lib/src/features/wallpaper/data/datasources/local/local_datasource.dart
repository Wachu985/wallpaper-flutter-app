import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/photo.dart';

abstract class LocalDatasource {
  Future<bool> isFavorite(int photoId);
  Future<void> toogleFavorite(PhotoModel photo);
  Future<List<Photo>> loadFavorites();
}
