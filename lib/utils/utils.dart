class Utils {
  static String queryBuilder(Map<String, String> map) {
    String query = "";
    map.forEach((key, value) {
      query = query + "&" + key + "=" + value;
    });
    return query;
  }

  static String persianDigits(String text) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }

    return text;
  }
}
