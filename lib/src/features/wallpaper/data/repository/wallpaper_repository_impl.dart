import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/request.dart';
import '../../domain/repository/wallpaper_repository.dart';
import '../datasources/remote/remote_datasource.dart';

class WallpaperRepositoryImpl implements WallpaperRepository {
  const WallpaperRepositoryImpl(
      {required RemoteDatasource datasource, required NetworkInfo connection})
      : _datasource = datasource,
        _connection = connection;
  final RemoteDatasource _datasource;
  final NetworkInfo _connection;

  @override
  Future<Either<Failure, Request>> getCurated() async {
    if (await _connection.isConnected) {
      try {
        final response = await _datasource.getCurated();
        return Right(response);
      } on NetworkException {
        return const Left(NetworkFailure(message: 'Error de Conexion'));
      }
    } else {
      return const Left(NetworkFailure(message: 'Error de Conexion'));
    }
  }

  @override
  Future<Either<Failure, Request>> searchPhoto(String search) async {
    if (await _connection.isConnected) {
      try {
        final response = await _datasource.searchPhoto(search);
        return Right(response);
      } on NetworkException {
        return const Left(NetworkFailure(message: 'Error de Conexion'));
      }
    } else {
      return const Left(NetworkFailure(message: 'Error de Conexion'));
    }
  }

  @override
  Future<Either<Failure, String>> downloadImage(String url) async {
    if (await _connection.isConnected) {
      try {
        final filename = await _datasource.downloadImage(url);

        return Right(filename);
      } on NetworkException {
        return const Left(NetworkFailure(message: 'Error de Conexion'));
      } catch (e) {
        return const Left(NetworkFailure(message: 'Error de Conexion'));
      }
    } else {
      return const Left(NetworkFailure(message: 'Error de Conexion'));
    }
  }
}
