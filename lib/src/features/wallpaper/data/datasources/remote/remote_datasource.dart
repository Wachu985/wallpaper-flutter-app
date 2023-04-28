import '../../../domain/entities/request.dart';

abstract class RemoteDatasource {
  Future<Request> getCurated();
  Future<Request> searchPhoto(String search);
  Future<String> downloadImage(String url);
}
