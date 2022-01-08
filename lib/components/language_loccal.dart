class LanguageLocal {
  final isoLangs = {
    "zh": "Chinese",
    "cs": "Czech",
    "en": "English",
    "fr": "French",
    "de": "German",
    "id": "Indonesian",
    "it": "Italian",
    "ja": "Japanese",
    "ru": "Russian",
    "es": "Spanish",
    "th": "Thai",
    "vi": "Vietnamese",
  };

  getDisplayLanguage(key) {
    if (isoLangs.containsKey(key)) {
      return isoLangs[key];
    } else {
      throw Exception("Language key incorrect");
    }
  }
}
