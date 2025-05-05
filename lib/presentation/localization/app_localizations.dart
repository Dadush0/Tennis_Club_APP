import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @openCourtPage.
  ///
  /// In de, this message translates to:
  /// **'Buchungsseite öffnen'**
  String get openCourtPage;

  /// No description provided for @login.
  ///
  /// In de, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In de, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @loginAdmin.
  ///
  /// In de, this message translates to:
  /// **'Als Admin einloggen'**
  String get loginAdmin;

  /// No description provided for @language.
  ///
  /// In de, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @password.
  ///
  /// In de, this message translates to:
  /// **'Passwort'**
  String get password;

  /// No description provided for @news.
  ///
  /// In de, this message translates to:
  /// **'Neuigkeiten'**
  String get news;

  /// No description provided for @court.
  ///
  /// In de, this message translates to:
  /// **'Plätze'**
  String get court;

  /// No description provided for @lineup.
  ///
  /// In de, this message translates to:
  /// **'Aufstellung'**
  String get lineup;

  /// No description provided for @events.
  ///
  /// In de, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @next.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get next;

  /// No description provided for @away.
  ///
  /// In de, this message translates to:
  /// **'Auswärts'**
  String get away;

  /// No description provided for @home.
  ///
  /// In de, this message translates to:
  /// **'Heim'**
  String get home;

  /// No description provided for @addNewGame.
  ///
  /// In de, this message translates to:
  /// **'Neues Spiel hinzufügen'**
  String get addNewGame;

  /// No description provided for @editGame.
  ///
  /// In de, this message translates to:
  /// **'Spiel editieren'**
  String get editGame;

  /// No description provided for @cancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get cancel;

  /// No description provided for @submit.
  ///
  /// In de, this message translates to:
  /// **'Bestätigen'**
  String get submit;

  /// No description provided for @opponent.
  ///
  /// In de, this message translates to:
  /// **'Gegner'**
  String get opponent;

  /// No description provided for @opponentName.
  ///
  /// In de, this message translates to:
  /// **'Name des Gegners'**
  String get opponentName;

  /// No description provided for @selectDate.
  ///
  /// In de, this message translates to:
  /// **'Datum wählen'**
  String get selectDate;

  /// No description provided for @selectDeadline.
  ///
  /// In de, this message translates to:
  /// **'Anmeldeschluss wählen'**
  String get selectDeadline;

  /// No description provided for @selectTime.
  ///
  /// In de, this message translates to:
  /// **'Zeit wählen'**
  String get selectTime;

  /// No description provided for @player.
  ///
  /// In de, this message translates to:
  /// **'Spieler'**
  String get player;

  /// No description provided for @player1.
  ///
  /// In de, this message translates to:
  /// **'Spieler 1'**
  String get player1;

  /// No description provided for @player2.
  ///
  /// In de, this message translates to:
  /// **'Spieler 2'**
  String get player2;

  /// No description provided for @player3.
  ///
  /// In de, this message translates to:
  /// **'Spieler 3'**
  String get player3;

  /// No description provided for @player4.
  ///
  /// In de, this message translates to:
  /// **'Spieler 4'**
  String get player4;

  /// No description provided for @player5.
  ///
  /// In de, this message translates to:
  /// **'Spieler 5'**
  String get player5;

  /// No description provided for @player6.
  ///
  /// In de, this message translates to:
  /// **'Spieler 6'**
  String get player6;

  /// No description provided for @cake.
  ///
  /// In de, this message translates to:
  /// **'Kuchen'**
  String get cake;

  /// No description provided for @cake1.
  ///
  /// In de, this message translates to:
  /// **'Kuchen 1'**
  String get cake1;

  /// No description provided for @cake2.
  ///
  /// In de, this message translates to:
  /// **'Kuchen 2'**
  String get cake2;

  /// No description provided for @cake3.
  ///
  /// In de, this message translates to:
  /// **'Kuchen 3'**
  String get cake3;

  /// No description provided for @manager.
  ///
  /// In de, this message translates to:
  /// **'Betreuer/Fahrer'**
  String get manager;

  /// No description provided for @sure.
  ///
  /// In de, this message translates to:
  /// **'Wirklich löschen?'**
  String get sure;

  /// No description provided for @yes.
  ///
  /// In de, this message translates to:
  /// **'Ja'**
  String get yes;

  /// No description provided for @against.
  ///
  /// In de, this message translates to:
  /// **'gegen'**
  String get against;

  /// No description provided for @teamname.
  ///
  /// In de, this message translates to:
  /// **'Mannschaft'**
  String get teamname;

  /// No description provided for @favourite.
  ///
  /// In de, this message translates to:
  /// **'Als Favorit markiert'**
  String get favourite;

  /// No description provided for @title.
  ///
  /// In de, this message translates to:
  /// **'Titel'**
  String get title;

  /// No description provided for @titleHint.
  ///
  /// In de, this message translates to:
  /// **'Titel eingeben'**
  String get titleHint;

  /// No description provided for @shorttext.
  ///
  /// In de, this message translates to:
  /// **'Kurzbeschreibung'**
  String get shorttext;

  /// No description provided for @shorttextHint.
  ///
  /// In de, this message translates to:
  /// **'Kurzbeschreibung eingeben'**
  String get shorttextHint;

  /// No description provided for @content.
  ///
  /// In de, this message translates to:
  /// **'Inhalt'**
  String get content;

  /// No description provided for @contentHint.
  ///
  /// In de, this message translates to:
  /// **'Inhalt eingeben'**
  String get contentHint;

  /// No description provided for @description.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get description;

  /// No description provided for @descriptionHint.
  ///
  /// In de, this message translates to:
  /// **'Gib deine Beschreibung ein'**
  String get descriptionHint;

  /// No description provided for @location.
  ///
  /// In de, this message translates to:
  /// **'Ort'**
  String get location;

  /// No description provided for @locationHint.
  ///
  /// In de, this message translates to:
  /// **'Gib den Veranstaltungsort an'**
  String get locationHint;

  /// No description provided for @addPicture.
  ///
  /// In de, this message translates to:
  /// **'Bild hinzufügen'**
  String get addPicture;

  /// No description provided for @create.
  ///
  /// In de, this message translates to:
  /// **'Erstellen'**
  String get create;

  /// No description provided for @readMore.
  ///
  /// In de, this message translates to:
  /// **'Weiterlesen'**
  String get readMore;

  /// No description provided for @cost.
  ///
  /// In de, this message translates to:
  /// **'Kosten'**
  String get cost;

  /// No description provided for @costHint.
  ///
  /// In de, this message translates to:
  /// **'Kosten eingeben'**
  String get costHint;

  /// No description provided for @maxParticipants.
  ///
  /// In de, this message translates to:
  /// **'Max. Teilnehmer'**
  String get maxParticipants;

  /// No description provided for @maxParticipantsInfo.
  ///
  /// In de, this message translates to:
  /// **'Max. Teilnehmer? '**
  String get maxParticipantsInfo;

  /// No description provided for @maxParticipantsHint.
  ///
  /// In de, this message translates to:
  /// **'Gib die maximale Anzahl an Teilnehmern an'**
  String get maxParticipantsHint;

  /// No description provided for @when.
  ///
  /// In de, this message translates to:
  /// **'Wann? '**
  String get when;

  /// No description provided for @where.
  ///
  /// In de, this message translates to:
  /// **'Wo? '**
  String get where;

  /// No description provided for @deadline.
  ///
  /// In de, this message translates to:
  /// **'Anmeldeschluss? '**
  String get deadline;

  /// No description provided for @costInfo.
  ///
  /// In de, this message translates to:
  /// **'Kosten? '**
  String get costInfo;

  /// No description provided for @tooLate.
  ///
  /// In de, this message translates to:
  /// **'Zu spät'**
  String get tooLate;

  /// No description provided for @full.
  ///
  /// In de, this message translates to:
  /// **'Voll'**
  String get full;

  /// No description provided for @signup.
  ///
  /// In de, this message translates to:
  /// **'Anmelden'**
  String get signup;

  /// No description provided for @name.
  ///
  /// In de, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @participants.
  ///
  /// In de, this message translates to:
  /// **'Teilnehmer'**
  String get participants;

  /// No description provided for @close.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get close;

  /// No description provided for @titleMissing.
  ///
  /// In de, this message translates to:
  /// **'Es muss ein Titel eingegeben werden!'**
  String get titleMissing;

  /// No description provided for @gameInfoMissing.
  ///
  /// In de, this message translates to:
  /// **'Gegnername fehlt!'**
  String get gameInfoMissing;

  /// No description provided for @playerInfoMissing.
  ///
  /// In de, this message translates to:
  /// **'Mindestens ein Spieler fehlt!'**
  String get playerInfoMissing;

  /// No description provided for @playerDuplicate.
  ///
  /// In de, this message translates to:
  /// **'Mindestens ein Spieler ist doppelt!'**
  String get playerDuplicate;

  /// No description provided for @orgaInfoMissing.
  ///
  /// In de, this message translates to:
  /// **'Mindestens eine Information fehlt!'**
  String get orgaInfoMissing;

  /// No description provided for @informationMisFit.
  ///
  /// In de, this message translates to:
  /// **'Informationen müssen zu den Spielernamen passen'**
  String get informationMisFit;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
