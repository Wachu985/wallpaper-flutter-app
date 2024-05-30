import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/features/wallpaper/presentation/widgets/gradient_box.dart';

import '../bloc/wallpaper_bloc.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    final List<String> menuOptions = [
      textTraslate.wallpaperOption1,
      textTraslate.wallpaperOption2,
      textTraslate.wallpaperOption3,
    ];
    return BlocListener<WallpaperBloc, WallpaperState>(
      listenWhen: (previous, current) {
        if (previous.isBLoading && current.isBSuccess) {
          return true;
        } else if (previous.isBLoading && current.isBError) {
          return true;
        } else if (previous.isDownload && current.isDownload) {
          return false;
        } else if (previous.isDownloading && current.isDownload) {
          return true;
        } else if (previous.isDownloading && current.isDError) {
          return true;
        }
        return true;
      },
      listener: (context, state) {
        if (state.isDownload) {
          Fluttertoast.showToast(
              msg: textTraslate.toastSuccess,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.black,
              fontSize: 16.0);
          BlocProvider.of<WallpaperBloc>(context)
              .add(WallpaperEvent.initialAllEvent());
        } else if (state.isDError) {
          Fluttertoast.showToast(
              msg: textTraslate.toastError,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.black,
              fontSize: 16.0);
          BlocProvider.of<WallpaperBloc>(context)
              .add(WallpaperEvent.initialAllEvent());
        } else if (state.isBSuccess) {
          Fluttertoast.showToast(
              msg: textTraslate.toastWallpaperSuccess,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.black,
              fontSize: 16.0);
          BlocProvider.of<WallpaperBloc>(context)
              .add(WallpaperEvent.initialAllEvent());
        } else if (state.isBError) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueGrey,
              textColor: Colors.black,
              fontSize: 16.0);
          BlocProvider.of<WallpaperBloc>(context)
              .add(WallpaperEvent.initialAllEvent());
        }
      },
      child: BlocBuilder<WallpaperBloc, WallpaperState>(
        builder: (context, state) {
          return Scaffold(
              body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: state.photo!.src.portrait ?? '',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset('assets/no-image.jpg', fit: BoxFit.cover),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/no-image.jpg', fit: BoxFit.cover),
              ),
              const GradientBox(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topLeft,
                stops: [0.0, 0.3],
              ),
              const GradientBox(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.4],
              ),
              AppBar(
                titleTextStyle: const TextStyle(fontSize: 15),
                iconTheme: const IconThemeData(color: Colors.white),
                centerTitle: true,
                title: Text(state.photo!.alt),
                backgroundColor: Colors.transparent,
              ),
              Positioned(
                bottom: 20,
                left: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BlocBuilder<WallpaperBloc, WallpaperState>(
                          builder: (context, state) {
                            return AlertDialog(
                              title: Text(textTraslate.alertDialogText),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    ...menuOptions.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      String option = entry.value;
                                      return RadioListTile(
                                        title: Text(option),
                                        value: index,
                                        groupValue: state.selectOption,
                                        onChanged: (int? value) {
                                          BlocProvider.of<WallpaperBloc>(
                                                  context)
                                              .add(WallpaperEvent.changeOption(
                                                  option: value ?? 0));
                                        },
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(textTraslate.alertDialogNot),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(textTraslate.alertDialogOk),
                                  onPressed: () {
                                    BlocProvider.of<WallpaperBloc>(context)
                                        .add(WallpaperEvent.setWallpaperEvent(
                                      url: state.photo!.src.portrait ?? '',
                                    ));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  heroTag: '1',
                  child: state.isBLoading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.wallpaper),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: FloatingActionButton(
                  onPressed: () async {
                    final provider = BlocProvider.of<WallpaperBloc>(context);
                    if (await context
                        .read<WallpaperBloc>()
                        .getStoragePermission()) {
                      provider.add(WallpaperEvent.downloadImage(
                          url: state.photo!.src.portrait ?? ''));
                    }
                  },
                  heroTag: '2',
                  child: state.isDownloading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.download),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
