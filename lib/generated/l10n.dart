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

  /// `Dark Mode Setting`
  String get DarkModeTitle {
    return Intl.message(
      'Dark Mode Setting',
      name: 'DarkModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get DarkModeAuto {
    return Intl.message(
      'Auto',
      name: 'DarkModeAuto',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get DarkModeDark {
    return Intl.message(
      'Dark',
      name: 'DarkModeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get DarkModeLight {
    return Intl.message(
      'Light',
      name: 'DarkModeLight',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get LanguageTitle {
    return Intl.message(
      'Language',
      name: 'LanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get HomeTitle {
    return Intl.message(
      'Home',
      name: 'HomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get AccountTitle {
    return Intl.message(
      'Account',
      name: 'AccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get SettingTitle {
    return Intl.message(
      'Settings',
      name: 'SettingTitle',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get HistoryTitle {
    return Intl.message(
      'History',
      name: 'HistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Stars`
  String get StarsTitle {
    return Intl.message(
      'Stars',
      name: 'StarsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get DownloadTitle {
    return Intl.message(
      'Download',
      name: 'DownloadTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get LoginTitle {
    return Intl.message(
      'Login',
      name: 'LoginTitle',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
