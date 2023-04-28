import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/entities/request.dart';

import '../../../../../core/environment/environment_config.dart';
import '../../../../../core/errors/exception.dart';
import '../../models/request_model.dart';
import 'remote_datasource.dart';

class DioRemoteDatasource implements RemoteDatasource {
  const DioRemoteDatasource({required Dio client}) : _client = client;
  final Dio _client;

  @override
  Future<Request> getCurated() async {
    try {
      final response = await _client.get(
          'https://api.pexels.com/v1/curated?per_page=80',
          options:
              Options(headers: {"Authorization": EnvironmentConfig.apiUrl}));
      if (response.statusCode == 200) {
        return RequestModel.fromJson(response.data);
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<Request> searchPhoto(String search) async {
    try {
      final response = await _client.get(
          'https://api.pexels.com/v1/search?query=$search&per_page=80',
          options:
              Options(headers: {"Authorization": EnvironmentConfig.apiUrl}));
      if (response.statusCode == 200) {
        return RequestModel.fromJson(response.data);
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future<String> downloadImage(String url) async {
    try {
      final List<Directory>? appDocumentsDir =
          await getExternalStorageDirectories();
      if (appDocumentsDir != null && appDocumentsDir.isNotEmpty) {
        final dir = appDocumentsDir.first.path.split('/Android/').first;
        final response = await _client.download(
            url, '$dir/Pictures/${url.split('/').last.split('?').first}');
        if (response.statusCode == 200) {
          return '$dir/Pictures/${url.split('/').last.split('?').first}';
        } else {
          throw NetworkException();
        }
      } else {
        throw NetworkException();
      }
    } catch (e) {
      throw NetworkException();
    }
  }
}
