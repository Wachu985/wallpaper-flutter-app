import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/core/errors/failure.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/favorite_repository.dart';

class ToogleFavorite {
  const ToogleFavorite({required FavoriteRepository repository})
      : _repository = repository;
  final FavoriteRepository _repository;

  Future<Either<Failure, bool>> call({required PhotoModel photo}) async =>
      await _repository.toogleFavorite(photo);
}
