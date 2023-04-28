import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/request.dart';
import '../repository/wallpaper_repository.dart';

class SearchPhoto {
  const SearchPhoto({required WallpaperRepository repository})
      : _repository = repository;

  final WallpaperRepository _repository;

  Future<Either<Failure, Request>> call({required String search}) async =>
      await _repository.searchPhoto(search);
}
