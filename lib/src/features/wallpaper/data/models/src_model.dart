import '../../domain/entities/src.dart';

class SrcModel implements Src {
  const SrcModel(
      {required this.landscape,
      required this.large,
      required this.large2X,
      required this.medium,
      required this.original,
      required this.portrait,
      required this.small,
      required this.tiny});
  @override
  final String landscape;

  @override
  final String large;

  @override
  final String large2X;

  @override
  final String medium;

  @override
  final String original;

  @override
  final String portrait;

  @override
  final String tiny;

  @override
  final String small;
  @override
  List<Object?> get props =>
      [landscape, large, large2X, medium, original, portrait, small, tiny];

  @override
  bool? get stringify => false;

  factory SrcModel.fromJson(Map<String, dynamic> json) => SrcModel(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };
}
