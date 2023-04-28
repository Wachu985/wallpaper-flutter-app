import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repository/wallpaper_repository.dart';

class DownloadImage {
  const DownloadImage({required WallpaperRepository repository})
      : _repository = repository;
  final WallpaperRepository _repository;

  Future<Either<Failure, String>> call({required String url}) async =>
      await _repository.downloadImage(url);
}
