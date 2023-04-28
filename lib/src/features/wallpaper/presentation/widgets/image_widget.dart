import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/bloc/wallpaper_bloc.dart';

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
        child: Container(
          margin: const EdgeInsets.all(5),
          height: index % 2 == 0 ? 300 : 350,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/no-image.jpg'),
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(photo.src.portrait)),
          ),
        ),
      ),
    );
  }
}
