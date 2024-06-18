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

  /// `Home`
  String get HomeT {
    return Intl.message(
      'Home',
      name: 'HomeT',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get FavoriteT {
    return Intl.message(
      'Favorite',
      name: 'FavoriteT',
      desc: '',
      args: [],
    );
  }

  /// `myCart`
  String get CartT {
    return Intl.message(
      'myCart',
      name: 'CartT',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get ProfileT {
    return Intl.message(
      'Profile',
      name: 'ProfileT',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back?`
  String get Welcome_back {
    return Intl.message(
      'Welcome back?',
      name: 'Welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Search Ebook....`
  String get Search_ebook {
    return Intl.message(
      'Search Ebook....',
      name: 'Search_ebook',
      desc: '',
      args: [],
    );
  }

  /// `Search Faster\nTrustby Million`
  String get Search_ebookHead {
    return Intl.message(
      'Search Faster\nTrustby Million',
      name: 'Search_ebookHead',
      desc: '',
      args: [],
    );
  }

  /// `Popular Ebook`
  String get Popular_ebook {
    return Intl.message(
      'Popular Ebook',
      name: 'Popular_ebook',
      desc: '',
      args: [],
    );
  }

  /// `Read More `
  String get Read_more {
    return Intl.message(
      'Read More ',
      name: 'Read_more',
      desc: '',
      args: [],
    );
  }

  /// `Details E-book`
  String get Detalis_E_book {
    return Intl.message(
      'Details E-book',
      name: 'Detalis_E_book',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get Add_to_Cart {
    return Intl.message(
      'Add to Cart',
      name: 'Add_to_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Cheackout {
    return Intl.message(
      'Checkout',
      name: 'Cheackout',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get My_cart {
    return Intl.message(
      'My Cart',
      name: 'My_cart',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorite`
  String get Your_Favorite {
    return Intl.message(
      'Your Favorite',
      name: 'Your_Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get Paymnet {
    return Intl.message(
      'Payment',
      name: 'Paymnet',
      desc: '',
      args: [],
    );
  }

  /// `Tell Your Friends`
  String get Tell_your_Friends {
    return Intl.message(
      'Tell Your Friends',
      name: 'Tell_your_Friends',
      desc: '',
      args: [],
    );
  }

  /// `Dark/Light`
  String get Dark_Light {
    return Intl.message(
      'Dark/Light',
      name: 'Dark_Light',
      desc: '',
      args: [],
    );
  }

  /// `LOG OUT`
  String get LOG_OUT {
    return Intl.message(
      'LOG OUT',
      name: 'LOG_OUT',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get Wallet {
    return Intl.message(
      'Wallet',
      name: 'Wallet',
      desc: '',
      args: [],
    );
  }

  /// `Your Information`
  String get Your_Information {
    return Intl.message(
      'Your Information',
      name: 'Your_Information',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get Total_Price {
    return Intl.message(
      'Total Price',
      name: 'Total_Price',
      desc: '',
      args: [],
    );
  }

  /// `Done successfully`
  String get alert_Title {
    return Intl.message(
      'Done successfully',
      name: 'alert_Title',
      desc: '',
      args: [],
    );
  }

  /// `Your Book Added To Cart`
  String get alert_SubTitle {
    return Intl.message(
      'Your Book Added To Cart',
      name: 'alert_SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get local {
    return Intl.message(
      'English',
      name: 'local',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get Select_Language {
    return Intl.message(
      'Select Language',
      name: 'Select_Language',
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
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
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
