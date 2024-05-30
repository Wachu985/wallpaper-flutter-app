import '../../../domain/entities/request.dart';

abstract class RemoteDatasource {
  Future<Request> getCurated(int page);
  Future<Request> searchPhoto(String search);
  Future<String> downloadImage(String url);
}
