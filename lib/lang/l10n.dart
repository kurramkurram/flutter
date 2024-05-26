import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'lang/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja')
  ];

  /// No description provided for @home.
  ///
  /// In ja, this message translates to:
  /// **'ホーム'**
  String get home;

  /// No description provided for @search.
  ///
  /// In ja, this message translates to:
  /// **'検索'**
  String get search;

  /// No description provided for @analytics.
  ///
  /// In ja, this message translates to:
  /// **'統計'**
  String get analytics;

  /// No description provided for @user.
  ///
  /// In ja, this message translates to:
  /// **'ユーザ'**
  String get user;

  /// No description provided for @drawer_settings.
  ///
  /// In ja, this message translates to:
  /// **'設定'**
  String get drawer_settings;

  /// No description provided for @drawer_about_app.
  ///
  /// In ja, this message translates to:
  /// **'アプリについて'**
  String get drawer_about_app;

  /// No description provided for @drawer_qa.
  ///
  /// In ja, this message translates to:
  /// **'QA'**
  String get drawer_qa;

  /// No description provided for @drawer_license.
  ///
  /// In ja, this message translates to:
  /// **'ライセンス'**
  String get drawer_license;

  /// No description provided for @drawer_policy.
  ///
  /// In ja, this message translates to:
  /// **'利用規約'**
  String get drawer_policy;

  /// No description provided for @user_not_registered.
  ///
  /// In ja, this message translates to:
  /// **'ユーザ未登録'**
  String get user_not_registered;

  /// No description provided for @user_recommend_book.
  ///
  /// In ja, this message translates to:
  /// **'あなたにおすすめの書籍'**
  String get user_recommend_book;

  /// No description provided for @search_book_hint.
  ///
  /// In ja, this message translates to:
  /// **'タイトル'**
  String get search_book_hint;

  /// No description provided for @detail_book.
  ///
  /// In ja, this message translates to:
  /// **'詳細'**
  String get detail_book;

  /// No description provided for @detail_book_title.
  ///
  /// In ja, this message translates to:
  /// **'タイトル'**
  String get detail_book_title;

  /// No description provided for @detail_book_author.
  ///
  /// In ja, this message translates to:
  /// **'著者'**
  String get detail_book_author;

  /// No description provided for @detail_book_read.
  ///
  /// In ja, this message translates to:
  /// **'読んだ'**
  String get detail_book_read;

  /// No description provided for @detail_book_want_read.
  ///
  /// In ja, this message translates to:
  /// **'読みたい'**
  String get detail_book_want_read;

  /// No description provided for @detail_book_tag.
  ///
  /// In ja, this message translates to:
  /// **'タグ'**
  String get detail_book_tag;

  /// No description provided for @detail_book_tag_not_registred.
  ///
  /// In ja, this message translates to:
  /// **'タグを登録する'**
  String get detail_book_tag_not_registred;

  /// No description provided for @detail_book_date.
  ///
  /// In ja, this message translates to:
  /// **'日付'**
  String get detail_book_date;

  /// No description provided for @analytics_this_month_read.
  ///
  /// In ja, this message translates to:
  /// **'今月の読書量'**
  String get analytics_this_month_read;

  /// No description provided for @about_app_app_name.
  ///
  /// In ja, this message translates to:
  /// **'アプリ名'**
  String get about_app_app_name;

  /// No description provided for @about_app_version.
  ///
  /// In ja, this message translates to:
  /// **'バージョン名'**
  String get about_app_version;

  /// No description provided for @license_error.
  ///
  /// In ja, this message translates to:
  /// **'ライセンス情報を取得できませんでした'**
  String get license_error;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
