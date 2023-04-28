import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wallpaper_app/src/core/dependency_inyection/dependency_inyection.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';

import 'features/wallpaper/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInyection.sl<WallpaperBloc>()
        ..add(WallpaperEvent.chargeCurated())
        ..init(),
      lazy: false,
      child: MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          title: 'Wallpaper App',
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen()),
    );
  }
}
