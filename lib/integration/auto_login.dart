import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  Future<void> removeLogInToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic storedToken = await readToken();
    if (storedToken == token) {
      // check if current token id is the same as saved token
      prefs.remove("token").then((value) async {
        return await saveToken("null"); // set token back to null after removing
      });
    }
  }

  Future<dynamic> readToken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = await prefs.getString('token') ??
        "null"; // return null if token is not present
    return token;
  }

  Future<void> saveToken(String token) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

// set token value
    prefs.setString('token', token);
  }
}
