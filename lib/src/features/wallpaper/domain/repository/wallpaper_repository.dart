import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/request.dart';

import '../../../../core/errors/failure.dart';

abstract class WallpaperRepository {
  Future<Either<Failure, Request>> getCurated();
  Future<Either<Failure, Request>> searchPhoto(String search);
  Future<Either<Failure, String>> downloadImage(String url);
}
