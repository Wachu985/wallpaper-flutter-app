import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/core/errors/exception.dart';
import 'package:wallpaper_app/src/core/errors/failure.dart';
import 'package:wallpaper_app/src/core/network/network.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/local/local_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/models/photo_model.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/photo.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl(
      {required LocalDatasource datasource, required NetworkInfo connection})
      : _datasource = datasource,
        _connection = connection;
  final LocalDatasource _datasource;
  final NetworkInfo _connection;
  @override
  Future<Either<Failure, bool>> isFavorite(int photoId) async {
    if (await _connection.isConnected) {
      try {
        final response = await _datasource.isFavorite(photoId);
        return Right(response);
      } on NetworkException {
        return Left(NetworkFailure(message: S.current.conectionError));
      }
    } else {
      return Left(NetworkFailure(message: S.current.conectionError));
    }
  }

  @override
  Future<Either<Failure, List<Photo>>> loadFavorites() async {
    if (await _connection.isConnected) {
      try {
        final response = await _datasource.loadFavorites();
        return Right(response);
      } on NetworkException {
        return Left(NetworkFailure(message: S.current.conectionError));
      }
    } else {
      return Left(NetworkFailure(message: S.current.conectionError));
    }
  }

  @override
  Future<Either<Failure, bool>> toogleFavorite(PhotoModel photo) async {
    if (await _connection.isConnected) {
      try {
        await _datasource.toogleFavorite(photo);
        return const Right(true);
      } on NetworkException {
        return Left(NetworkFailure(message: S.current.conectionError));
      }
    } else {
      return Left(NetworkFailure(message: S.current.conectionError));
    }
  }
}
