import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  static const String _apiKey = '3348f86e2efc4a57a8f155607241312'; // OpenWeatherMap API key
  static const String _baseUrl = 'https://api.weatherapi.com/v1/current.json';  // WeatherAPI endpoint

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$_baseUrl?key=$_apiKey&q=$city&aqi=no'); // API request URL for WeatherAPI
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);  // Parse the JSON response
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
