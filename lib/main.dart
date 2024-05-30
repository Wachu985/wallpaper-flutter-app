import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';
import 'package:wallpaper_app/src/core/shared_preferences/shared_preferences_singlenton.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';

import 'src/app.dart';
import 'src/core/dependency_inyection/dependency_inyection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInyection.init();
  final prefs = SharedPreferencesSinglenton();
  await prefs.initPrefs();
  await dotenv.load(fileName: ".env");

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => DependencyInyection.sl<WallpaperBloc>()
        ..add(WallpaperEvent.chargeCurated())
        ..add(WallpaperEvent.loadFavorites())
        ..init(),
      lazy: false,
    ),
    BlocProvider(
      create: (context) =>
          DependencyInyection.sl<AppBloc>()..add(AppEvent.loadTheme()),
      lazy: false,
    ),
  ], child: const MyApp()));
}
