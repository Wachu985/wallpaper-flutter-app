import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/local/isar_local_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/local/local_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/remote/dio_remote_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/datasources/remote/remote_datasource.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/repository/favorite_repository_impl.dart';
import 'package:wallpaper_app/src/features/wallpaper/data/repository/wallpaper_repository_impl.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/favorite_repository.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/download_image.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/get_curated.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/is_favorite.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/load_favorites.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/search_photo.dart';
import 'package:wallpaper_app/src/features/wallpaper/domain/usescase/toogle_favorite.dart';

import '../../features/wallpaper/presentation/bloc/wallpaper_bloc.dart';
import '../network/network.dart';

class DependencyInyection {
  static final sl = GetIt.instance;
  static Future<void> init() async {
    // Bloc
    sl.registerFactory(() => WallpaperBloc(
        getCurated: sl(),
        searchPhoto: sl(),
        downloadImage: sl(),
        isFavorite: sl(),
        loadFavorites: sl(),
        toogleFavorite: sl()));
    sl.registerFactory(() => AppBloc());

    // UseCases
    sl.registerLazySingleton(() => GetCurated(repository: sl()));
    sl.registerLazySingleton(() => SearchPhoto(repository: sl()));
    sl.registerLazySingleton(() => DownloadImage(repository: sl()));
    sl.registerLazySingleton(() => IsFavorite(repository: sl()));
    sl.registerLazySingleton(() => ToogleFavorite(repository: sl()));
    sl.registerLazySingleton(() => LoadFavorites(repository: sl()));

    // Repository
    sl.registerLazySingleton<WallpaperRepository>(
        () => WallpaperRepositoryImpl(connection: sl(), datasource: sl()));
    sl.registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(connection: sl(), datasource: sl()));

    // Datasources
    sl.registerLazySingleton<RemoteDatasource>(
        () => DioRemoteDatasource(client: sl()));
    sl.registerLazySingleton<LocalDatasource>(() => IsarLocalDatasource());

    // Core
    sl.registerLazySingleton<NetworkInfo>(
        () => NetwotkInfoImpl(connection: sl()));

    // External
    sl.registerLazySingleton(
      () => Dio(
        BaseOptions(
          sendTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ),
    );
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
