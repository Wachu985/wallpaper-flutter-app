// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Developer`
  String get settingsDeveloperName {
    return Intl.message(
      'Developer',
      name: 'settingsDeveloperName',
      desc: '',
      args: [],
    );
  }

  /// `Project Portfolio`
  String get settingsGithubRepository {
    return Intl.message(
      'Project Portfolio',
      name: 'settingsGithubRepository',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingsDarkModeTitle {
    return Intl.message(
      'Dark Mode',
      name: 'settingsDarkModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enable dark mode`
  String get settingsDarkModeSustitle {
    return Intl.message(
      'Enable dark mode',
      name: 'settingsDarkModeSustitle',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get settingsColorTitle {
    return Intl.message(
      'Color',
      name: 'settingsColorTitle',
      desc: '',
      args: [],
    );
  }

  /// `App color`
  String get settingsColorSustitle {
    return Intl.message(
      'App color',
      name: 'settingsColorSustitle',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingsAboutTitle {
    return Intl.message(
      'About',
      name: 'settingsAboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get settingsAboutSustitle {
    return Intl.message(
      'Information',
      name: 'settingsAboutSustitle',
      desc: '',
      args: [],
    );
  }

  /// `App developed by:`
  String get settingsAboutText1 {
    return Intl.message(
      'App developed by:',
      name: 'settingsAboutText1',
      desc: '',
      args: [],
    );
  }

  /// `@All rights reserved.`
  String get settingsAboutText2 {
    return Intl.message(
      '@All rights reserved.',
      name: 'settingsAboutText2',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsAppbarTitle {
    return Intl.message(
      'Settings',
      name: 'settingsAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguageTitle {
    return Intl.message(
      'Language',
      name: 'settingsLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change the app language.`
  String get settingsLanguageSubtitle {
    return Intl.message(
      'Change the app language.',
      name: 'settingsLanguageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get wallpaperOption1 {
    return Intl.message(
      'Home Screen',
      name: 'wallpaperOption1',
      desc: '',
      args: [],
    );
  }

  /// `Lock Screen`
  String get wallpaperOption2 {
    return Intl.message(
      'Lock Screen',
      name: 'wallpaperOption2',
      desc: '',
      args: [],
    );
  }

  /// `Both Screens`
  String get wallpaperOption3 {
    return Intl.message(
      'Both Screens',
      name: 'wallpaperOption3',
      desc: '',
      args: [],
    );
  }

  /// `Image downloaded successfully.`
  String get toastSuccess {
    return Intl.message(
      'Image downloaded successfully.',
      name: 'toastSuccess',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during download.`
  String get toastError {
    return Intl.message(
      'An error occurred during download.',
      name: 'toastError',
      desc: '',
      args: [],
    );
  }

  /// `Wallpaper set successfully.`
  String get toastWallpaperSuccess {
    return Intl.message(
      'Wallpaper set successfully.',
      name: 'toastWallpaperSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Select where you want the wallpaper:`
  String get alertDialogText {
    return Intl.message(
      'Select where you want the wallpaper:',
      name: 'alertDialogText',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get alertDialogOk {
    return Intl.message(
      'Accept',
      name: 'alertDialogOk',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get alertDialogNot {
    return Intl.message(
      'Cancel',
      name: 'alertDialogNot',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchText {
    return Intl.message(
      'Search',
      name: 'searchText',
      desc: '',
      args: [],
    );
  }

  /// `No favorite wallpapers found.`
  String get favoritesNotFound {
    return Intl.message(
      'No favorite wallpapers found.',
      name: 'favoritesNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomNavBar1 {
    return Intl.message(
      'Home',
      name: 'bottomNavBar1',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get bottomNavBar2 {
    return Intl.message(
      'Favorites',
      name: 'bottomNavBar2',
      desc: '',
      args: [],
    );
  }

  /// `Oops.. no images found.`
  String get imagesNotFound {
    return Intl.message(
      'Oops.. no images found.',
      name: 'imagesNotFound',
      desc: '',
      args: [],
    );
  }

  /// `No download permissions.`
  String get notDownloadPermisions {
    return Intl.message(
      'No download permissions.',
      name: 'notDownloadPermisions',
      desc: '',
      args: [],
    );
  }

  /// `Could not set the wallpaper.`
  String get errorBloc1 {
    return Intl.message(
      'Could not set the wallpaper.',
      name: 'errorBloc1',
      desc: '',
      args: [],
    );
  }

  /// `No permission to set the wallpaper.`
  String get errorBloc2 {
    return Intl.message(
      'No permission to set the wallpaper.',
      name: 'errorBloc2',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while setting the wallpaper.`
  String get errorBloc3 {
    return Intl.message(
      'An error occurred while setting the wallpaper.',
      name: 'errorBloc3',
      desc: '',
      args: [],
    );
  }

  /// `A connection error occurred.`
  String get conectionError {
    return Intl.message(
      'A connection error occurred.',
      name: 'conectionError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
