import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/wallpaper_bloc.dart';
import '../widgets/image_widget.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        floatingActionButton: BlocBuilder<WallpaperBloc, WallpaperState>(
            builder: (context, state) {
          if (state.showElements) {
            return FadeIn(
              child: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<WallpaperBloc>(context)
                      .add(WallpaperEvent.chargeCurated());
                },
                child: const Icon(Icons.refresh_outlined),
              ),
            );
          } else {
            return Container();
          }
        }),
        body: Stack(
          children: [
            BlocBuilder<WallpaperBloc, WallpaperState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isSuccess) {
                  return MasonryGridView.count(
                    controller: BlocProvider.of<WallpaperBloc>(context)
                        .scrollController,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    itemCount: state.response!.photos.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ImageWidget(
                        index: index,
                        photo: state.response!.photos[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 60),
                        Text(
                          state.error,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
            BlocBuilder<WallpaperBloc, WallpaperState>(
                builder: (context, state) {
              if (state.showElements) {
                return FadeIn(
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SearchBar(
                        controller: searchController,
                        hintText: 'Buscar',
                        onPressed: (value) {
                          BlocProvider.of<WallpaperBloc>(context)
                              .add(WallpaperEvent.searchEvent(search: value));
                          searchController.clear();
                        },
                        onSubmitted: (value) {
                          BlocProvider.of<WallpaperBloc>(context)
                              .add(WallpaperEvent.searchEvent(search: value));
                          searchController.clear();
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            })
          ],
        ));
  }
}
