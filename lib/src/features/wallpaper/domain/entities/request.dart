import 'package:equatable/equatable.dart';

import 'photo.dart';

abstract class Request extends Equatable {
  final int totalResults;
  final int page;
  final int perPage;
  final List<Photo> photos;
  final String nextPage;

  const Request({
    required this.totalResults,
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  @override
  List<Object?> get props => [totalResults, page, perPage, photos, nextPage];
}
