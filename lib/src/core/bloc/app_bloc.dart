import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/src/core/shared_preferences/shared_preferences_singlenton.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _preferences = SharedPreferencesSinglenton();
  final List<String> _listLanguaje = ["es", "en"];
  AppBloc() : super(AppState.initialState()) {
    on<ChangePage>(changePage);
    on<ToogleDarkMode>(_toogleDarkMode);
    on<LoadTheme>(_loadTheme);
    on<SwitchColor>(_switchColor);
    on<SwitchLanguaje>(_switchLanguaje);
  }

  FutureOr<void> _toogleDarkMode(ToogleDarkMode event, Emitter<AppState> emit) {
    _preferences.darkMode = !state.darkMode;
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  FutureOr<void> _loadTheme(LoadTheme event, Emitter<AppState> emit) {
    final languaje = _preferences.selectedLanguaje;
    S.load(Locale(_listLanguaje[languaje]));
    emit(
      state.copyWith(
        darkMode: _preferences.darkMode,
        selectedColor: _preferences.selectedColor,
        selectedLanguaje: languaje,
      ),
    );
  }

  FutureOr<void> _switchColor(SwitchColor event, Emitter<AppState> emit) {
    _preferences.selectedColor = event.color;
    emit(state.copyWith(selectedColor: event.color));
  }

  FutureOr<void> _switchLanguaje(SwitchLanguaje event, Emitter<AppState> emit) {
    S.load(Locale(_listLanguaje[event.languaje]));
    _preferences.selectedLanguaje = event.languaje;
    emit(state.copyWith(selectedLanguaje: event.languaje));
  }

  FutureOr<void> changePage(ChangePage event, Emitter<AppState> emit) {
    emit(state.copyWith(pageSelected: event.newPage));
  }
}
