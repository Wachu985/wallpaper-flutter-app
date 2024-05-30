import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/core/bloc/app_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/screens/settings_screen.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/views/favorite_view.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/views/home_view.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/custom_bottom_navigation.dart';

import '../bloc/wallpaper_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(keepPage: true, initialPage: 0);
    super.initState();
  }

  final List<Widget> viewRoutes = const [HomeView(), FavoriteView()];

  @override
  Widget build(BuildContext context) {
    final pageSelected = context.watch<AppBloc>().state.pageSelected;
    super.build(context);
    if (pageController.hasClients) {
      if (pageController.page != null) {
        pageController.animateToPage(
          pageSelected,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 250),
        );
      }
    }
    return Scaffold(
      floatingActionButton: FadeIn(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const SettingsScreen(),
                  )),
              child: const Icon(Icons.settings_rounded),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FloatingActionButton(
                heroTag: '2',
                onPressed: () {
                  BlocProvider.of<WallpaperBloc>(context)
                    ..add(WallpaperEvent.chargeCurated())
                    ..add(WallpaperEvent.loadFavorites());
                },
                child: const Icon(Icons.refresh_outlined),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageSelected),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }
}
