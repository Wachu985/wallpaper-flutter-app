import 'package:equatable/equatable.dart';

abstract class Src extends Equatable {
  final String original;
  final String large2X;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  const Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  @override
  List<Object?> get props =>
      [original, large2X, large, medium, small, portrait, landscape, tiny];
}
