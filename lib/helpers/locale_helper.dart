import 'dart:ui';

Locale LocaleFromLangCode(String langCode) {
  List langCode_ = langCode.split("-");

  if (langCode_.length == 1) {
    langCode_.insert(1, "");
  }

  return Locale(langCode_[0], langCode_[1]);
}
