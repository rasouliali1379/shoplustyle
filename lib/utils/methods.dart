class Methods {
  static String queryBuilder(Map<String, String> map) {
    String query = "";
    map.forEach((key, value) {
      query = query + "&" + key + "=" + value;
    });
    return query;
  }
}
