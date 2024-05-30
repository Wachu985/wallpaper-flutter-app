import 'photo.dart';

abstract class Request {
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
}
