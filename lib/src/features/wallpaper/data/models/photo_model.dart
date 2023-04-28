import '../../domain/entities/photo.dart';
import 'src_model.dart';

class PhotoModel implements Photo {
  const PhotoModel(
      {required this.alt,
      required this.avgColor,
      required this.height,
      required this.id,
      required this.liked,
      required this.photographer,
      required this.photographerId,
      required this.photographerUrl,
      required this.src,
      required this.url,
      required this.width});
  @override
  final String alt;

  @override
  final String avgColor;

  @override
  final int height;

  @override
  final int id;

  @override
  final bool liked;

  @override
  final String photographer;

  @override
  final int photographerId;

  @override
  final String photographerUrl;

  @override
  final SrcModel src;

  @override
  final String url;

  @override
  final int width;

  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [
        alt,
        avgColor,
        height,
        id,
        liked,
        photographer,
        photographerId,
        photographerUrl,
        src,
        url,
        width
      ];

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: SrcModel.fromJson(json["src"]),
        liked: json["liked"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "liked": liked,
        "alt": alt,
      };
}
