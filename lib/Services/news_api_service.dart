import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = '5b5c0ca039774973af32c409bcd2c6f9';
  static const String _baseUrl = 'https://newsapi.org/v2';

  static Future<List> fetchSriLankaNews() async {
    final url = '$_baseUrl/everything?q=sri+lanka&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
