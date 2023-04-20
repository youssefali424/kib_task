import 'dart:ui';

enum SupportedLanguage {
  ar,
  en;

  static SupportedLanguage fromString(String language) {
    switch (language) {
      case 'en':
        return SupportedLanguage.en;
      case 'ar':
        return SupportedLanguage.ar;
      default:
        return SupportedLanguage.ar;
    }
  }

  static SupportedLanguage fromLocale(Locale language) {
    return fromString(language.languageCode);
  }

  static List<Locale> get supportedLocales {
    return [
      SupportedLanguage.ar.locale,
      SupportedLanguage.en.locale,
    ];
  }

  String get translate {
    switch (this) {
      case SupportedLanguage.en:
        return 'English';
      case SupportedLanguage.ar:
        return 'العربية';
    }
  }

  Locale get locale {
    return Locale(name);
  }
}
