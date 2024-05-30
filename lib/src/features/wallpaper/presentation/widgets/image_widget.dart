import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/gradient_box.dart';

import '../../domain/entities/photo.dart';
import '../screens/wallpaper_screen.dart';

class ImageWidget extends StatelessWidget {
  final int index;
  final Photo photo;
  const ImageWidget({super.key, required this.index, required this.photo});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 1500),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<WallpaperBloc>(context)
              .add(WallpaperEvent.changePage(photo: photo));
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const WallpaperScreen(),
              ));
        },
        child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: index % 2 == 0 ? 300 : 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: photo.src.portrait ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Image.asset('assets/no-image.jpg', fit: BoxFit.cover),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/no-image.jpg', fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const GradientBox(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.95],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FutureBuilder<bool>(
                      future:
                          context.read<WallpaperBloc>().isFavorite(photo.id),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator(
                              strokeWidth: 2);
                        } else {
                          return IconButton(
                              onPressed: () => context
                                  .read<WallpaperBloc>()
                                  .add(WallpaperEvent.toogleFavorite(
                                      photo: photo)),
                              icon: Icon(
                                snapshot.data!
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_rounded,
                                color:
                                    snapshot.data! ? Colors.red : Colors.white,
                              ));
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
