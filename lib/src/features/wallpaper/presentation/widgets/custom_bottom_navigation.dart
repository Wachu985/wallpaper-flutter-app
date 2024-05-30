import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    return BottomNavigationBar(
      elevation: 20,
      onTap: (value) => onSelectedItem(context, value),
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_max_rounded),
          label: textTraslate.bottomNavBar1,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_outline),
          label: textTraslate.bottomNavBar2,
        ),
      ],
    );
  }

  void onSelectedItem(BuildContext context, int value) {
    switch (value) {
      case 0:
        context.read<AppBloc>().add(AppEvent.changePage(newPage: 0));
        break;
      case 1:
        context.read<AppBloc>().add(AppEvent.changePage(newPage: 1));
        break;
    }
  }
}
