import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/photo.dart';

import '../../../../core/errors/failure.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, bool>> toogleFavorite(PhotoModel url);
  Future<Either<Failure, bool>> isFavorite(int photoId);
  Future<Either<Failure, List<Photo>>> loadFavorites();
}
