import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';
import 'package:wallpaper_app/src/core/theme/app_theme.dart';

import 'features/wallpaper/presentation/screens/home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      title: 'WallpaperGo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme(
        darkMode: context.select((AppBloc bloc) => bloc.state.darkMode),
        selectedColor:
            context.select((AppBloc bloc) => bloc.state.selectedColor),
      ).getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
