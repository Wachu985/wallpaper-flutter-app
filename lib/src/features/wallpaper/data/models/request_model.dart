import '../../domain/entities/request.dart';
import 'photo_model.dart';

class RequestModel implements Request {
  const RequestModel(
      {required this.nextPage,
      required this.page,
      required this.perPage,
      required this.photos,
      required this.totalResults});

  @override
  final String nextPage;

  @override
  final int page;

  @override
  final int perPage;

  @override
  final List<PhotoModel> photos;

  @override
  final int totalResults;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        totalResults: json["total_results"] ?? 0,
        page: json["page"],
        perPage: json["per_page"],
        photos: List<PhotoModel>.from(
            json["photos"].map((x) => PhotoModel.fromJson(x))),
        nextPage: json["next_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_results": totalResults,
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "next_page": nextPage,
      };
}
