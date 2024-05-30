import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/core/errors/failure.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/photo.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/favorite_repository.dart';

class LoadFavorites {
  const LoadFavorites({required FavoriteRepository repository})
      : _repository = repository;
  final FavoriteRepository _repository;

  Future<Either<Failure, List<Photo>>> call() async =>
      await _repository.loadFavorites();
}
