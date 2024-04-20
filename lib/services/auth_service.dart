import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  static Future<bool> login(String email, String password) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      var url = Uri.parse("$baseUrl/auth/login");
      var response = await http.post(
        url,
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var token = jsonResponse['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        List<String>? emails = prefs.getStringList('emails') ?? [];
        if (!emails.contains(email)) {
          emails.add(email);
          await prefs.setStringList('emails', emails);
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}