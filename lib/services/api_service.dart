import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:5000/api';

  static Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
  }

  static Future<http.Response> register(
      String name, String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
  }

  static Future<List> getArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/articles'));
    return jsonDecode(response.body);
  }

  static Future<List> getPlants() async {
    final response = await http.get(Uri.parse('$baseUrl/plants'));
    return jsonDecode(response.body);
  }
}
