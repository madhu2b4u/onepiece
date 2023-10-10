class Constants {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `LocalStorageKey()` accidentally
  Constants._();
  /*
    use of shared preferences in the project
    ****************************************************************
    https://pub.dev/packages/get_storage
    final box = GetStorage();
    box.write(Constants.saveUserId, "Madhu Kalyan");
    box.read(Constants.saveUserId)
   */

  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.
  static const String isLoggedIn = 'isLoggedIn';

}
