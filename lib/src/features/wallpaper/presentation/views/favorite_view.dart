import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/error_widget_custom.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/image_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<WallpaperBloc>().state;
    final textTraslate = S.of(context);
    if (state.isFSuccess) {
      return state.notFavorites
          ? Center(
              child: ErrorWidgetCustom(text: textTraslate.favoritesNotFound),
            )
          : MasonryGridView.count(
              controller:
                  BlocProvider.of<WallpaperBloc>(context).scrollController,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemCount: state.listFavorites.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ImageWidget(
                    index: index,
                    photo: state.listFavorites[index],
                  ),
                );
              },
            );
    } else if (state.isFError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ErrorWidgetCustom(text: state.error)],
        ),
      );
    } else {
      return Container();
    }
  }
}
