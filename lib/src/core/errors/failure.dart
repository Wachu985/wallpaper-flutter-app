import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}
