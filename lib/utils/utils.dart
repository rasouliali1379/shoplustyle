class Utils {
  static String queryBuilder(Map<String, String> map) {
    String query = "";
    map.forEach((key, value) {
      query = query + "&" + key + "=" + value;
    });
    return query;
  }

  static String toPersianDigits(String text) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }

    return text;
  }

  static String toEnglishDigits(String text) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(farsi[i], english[i]);
    }

    return text;
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static String mergeArrayItems(List<String> options, String separator) {
    String mergedOptions = "";

    for (final item in options) {
      mergedOptions += item;

      if (options.indexOf(item) != options.length - 1) {
        mergedOptions += separator;
      }
    }
    return mergedOptions;
  }

  static String mergeIntArrayItems(List<int> options, String separator) {
    String mergedOptions = "";

    for (final item in options) {
      mergedOptions += item.toString();

      if (options.indexOf(item) != options.length - 1) {
        mergedOptions += separator;
      }
    }
    return mergedOptions;
  }
}
