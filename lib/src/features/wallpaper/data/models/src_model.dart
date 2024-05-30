import 'package:isar/isar.dart';

import '../../domain/entities/src.dart';
part 'src_model.g.dart';

@embedded
class SrcModel implements Src {
  const SrcModel(
      {this.landscape,
      this.large,
      this.large2X,
      this.medium,
      this.original,
      this.portrait,
      this.small,
      this.tiny});
  @override
  final String? landscape;

  @override
  final String? large;

  @override
  final String? large2X;

  @override
  final String? medium;

  @override
  final String? original;

  @override
  final String? portrait;

  @override
  final String? tiny;

  @override
  final String? small;
  

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
