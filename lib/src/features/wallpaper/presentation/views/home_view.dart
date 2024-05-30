import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/error_widget_custom.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/image_widget.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/search_bar_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Stack(
      children: [
        BlocBuilder<WallpaperBloc, WallpaperState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            } else if (state.isSuccess) {
              return MasonryGridView.count(
                controller:
                    BlocProvider.of<WallpaperBloc>(context).scrollController,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemCount: state.response.length,
                padding: const EdgeInsets.only(top: 115),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ImageWidget(
                      index: index,
                      photo: state.response[index],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ErrorWidgetCustom(text: state.error)],
                ),
              );
            }
          },
        ),
        BlocBuilder<WallpaperBloc, WallpaperState>(builder: (context, state) {
          if (state.showElements) {
            final textTraslate = S.of(context);
            return FadeIn(
              child: SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SearchBarCustom(
                    controller: searchController,
                    hintText: textTraslate.searchText,
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
    );
  }
}
