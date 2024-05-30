import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/core/errors/failure.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/favorite_repository.dart';

class IsFavorite {
  const IsFavorite({required FavoriteRepository repository})
      : _repository = repository;
  final FavoriteRepository _repository;

  Future<Either<Failure, bool>> call({required int photoId}) async =>
      await _repository.isFavorite(photoId);
}
