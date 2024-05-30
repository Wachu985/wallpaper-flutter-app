part of 'app_bloc.dart';

abstract class AppEvent {
  factory AppEvent.changePage({required int newPage}) =>
      ChangePage(newPage: newPage);
  factory AppEvent.loadTheme() => LoadTheme();
  factory AppEvent.toogleDarkMode() => ToogleDarkMode();
  factory AppEvent.switchColor({required int color}) =>
      SwitchColor(color: color);
  factory AppEvent.switchLanguaje({required int languaje}) =>
      SwitchLanguaje(languaje: languaje);
}

class LoadTheme implements AppEvent {}

class ToogleDarkMode implements AppEvent {}

class SwitchColor implements AppEvent {
  final int color;

  SwitchColor({required this.color});
}

class SwitchLanguaje implements AppEvent {
  final int languaje;

  SwitchLanguaje({required this.languaje});
}

class ChangePage implements AppEvent {
  final int newPage;

  ChangePage({required this.newPage});
}
