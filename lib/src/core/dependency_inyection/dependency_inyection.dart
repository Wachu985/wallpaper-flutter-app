import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/remote/dio_remote_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/remote/remote_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/repository/wallpaper_repository_impl.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/download_image.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/get_curated.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/search_photo.dart';

import '../../features/wallpaper/presentation/bloc/wallpaper_bloc.dart';
import '../network/network.dart';

class DependencyInyection {
  static final sl = GetIt.instance;
  static Future<void> init() async {
    // Bloc
    sl.registerFactory(() => WallpaperBloc(
        getCurated: sl(), searchPhoto: sl(), downloadImage: sl()));

    // UseCases
    sl.registerLazySingleton(() => GetCurated(repository: sl()));
    sl.registerLazySingleton(() => SearchPhoto(repository: sl()));
    sl.registerLazySingleton(() => DownloadImage(repository: sl()));

    // Repository
    sl.registerLazySingleton<WallpaperRepository>(
        () => WallpaperRepositoryImpl(connection: sl(), datasource: sl()));

    // Datasources
    sl.registerLazySingleton<RemoteDatasource>(
        () => DioRemoteDatasource(client: sl()));

    // Core
    sl.registerLazySingleton<NetworkInfo>(
        () => NetwotkInfoImpl(connection: sl()));

    // External
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
