class ApiEndpoints {
  static const String baseUrl = "https://fff56b1ca910.ngrok.io/";

  //"http://18.222.253.154/";
  static const String account = baseUrl + "api/account/name";
  static const String createPet = baseUrl + "petdata/create_pet";
  static const String getPet = baseUrl + "petdata/allpetdata";
  static const String myPet = baseUrl + "petdata/user_pet";
  static String categoryPet(
    String category,
    String long,
    String lat,
  ) =>
      baseUrl +
      "petdata/category_pet" +
      "?category=$category&latitude=$lat&longitude=$long";
  static String locationViewPet(
    String long,
    String lat,
  ) =>
      baseUrl + "petdata/location_pet" + "?latitude=$lat&longitude=$long";
  static String petDeleteUpdate(int id) => baseUrl + "petdata/all_pet/$id";
  static String searchPet(
    String name,
    String long,
    String lat,
  ) =>
      baseUrl +
      "petdata/search_pet?petName=$name&latitude=$lat&longitude=$long";
  static String searchLocation(
    String name,
  ) =>
      baseUrl + "location/searchlocation?name=$name";
  static String getLocationDistrict(
    String name,
  ) =>
      baseUrl + "location/district?district=$name";
}
