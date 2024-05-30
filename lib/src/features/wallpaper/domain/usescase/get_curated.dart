import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/request.dart';
import '../repository/wallpaper_repository.dart';

class GetCurated {
  const GetCurated({required WallpaperRepository repository})
      : _repository = repository;
  final WallpaperRepository _repository;

  Future<Either<Failure, Request>> call({int page = 1}) async =>
      await _repository.getCurated(page);
}
