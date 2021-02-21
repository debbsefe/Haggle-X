import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  static const String token = 'token';
  Future<void> saveToken(String usertoken) async {
    try {
      await storage.write(key: token, value: usertoken.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future retrieveToken() async {
    try {
      var usertoken = await storage.read(key: token);
      return usertoken;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
