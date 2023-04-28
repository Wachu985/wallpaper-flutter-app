import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import '../bloc/wallpaper_bloc.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> menuOptions = [
      'Pantalla Principal',
      'Pantalla de Bloqueo',
      'Ambas Pantallas',
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
              msg: "Imagen Descargada Correctamente",
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
              msg: "Error al Descargar la Imagen",
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
              msg: "Fondo de Pantalla Establecido Correctamente",
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
              FadeInImage(
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(state.photo!.src.portrait)),
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
                              title: const Text(
                                  'Selecciona donde desea el Fondo:'),
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
                                  child: const Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () {
                                    BlocProvider.of<WallpaperBloc>(context)
                                        .add(WallpaperEvent.setWallpaperEvent(
                                      url: state.photo!.src.portrait,
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
                    if (await Permission.storage.request().isGranted) {
                      provider.add(WallpaperEvent.downloadImage(
                          url: state.photo!.src.portrait));
                    }
                  },
                  heroTag: '2',
                  child: state.isDownloading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.download),
                ),
              )
            ],
          ));
        },
      ),
    );
  }
}
