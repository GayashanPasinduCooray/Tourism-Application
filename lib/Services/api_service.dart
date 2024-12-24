import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = '5b5c0ca039774973af32c409bcd2c6f9';
  static const String _baseUrl = 'https://newsapi.org/v2';

  // Fetch news for Sri Lanka
  Future<List<dynamic>> fetchSriLankaNews() async {
    final url = '$_baseUrl/everything?q=sri+lanka&apiKey=$_apiKey'; // This is similar to your old code
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print("API Response: $data");  // Print the response body to check it
      if (data['status'] == 'ok' && data['articles'] != null) {
        return data['articles']; // Return articles if found
      } else {
        throw Exception('No articles found for Sri Lanka');
      }
    } else {
      throw Exception('Failed to load news for Sri Lanka');
    }
  }

  // Search news articles based on a query
  Future<List<dynamic>> searchNews(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/everything?q=$query&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'ok' && data['articles'] != null) {
        return data['articles'];
      } else {
        throw Exception('No search results found for $query');
      }
    } else {
      throw Exception('Failed to search news');
    }
  }
}
