import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Services/weather_api_service.dart';

class SriLankaWeatherScreen extends StatefulWidget {
  @override
  _SriLankaWeatherScreenState createState() => _SriLankaWeatherScreenState();
}

class _SriLankaWeatherScreenState extends State<SriLankaWeatherScreen> {
  late Future<Map<String, dynamic>> weatherData;
  String selectedCity = 'Colombo'; // Default city

  final cities = [
    'Colombo',
    'Kandy',
    'Galle',
    'Jaffna',
    'Anuradhapura',
    'Matara',
    'Trincomalee',
    'Negombo',
    'Ratnapura',
    'Kurunegala',
    'Batticaloa',
    'Vavuniya',
  ];

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  // Fetch weather data based on the selected city
  void fetchWeather() {
    setState(() {
      weatherData = WeatherApiService().getWeather(selectedCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sri Lanka Weather - $selectedCity'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCity,
              onChanged: (newCity) {
                setState(() {
                  selectedCity = newCity!;
                  fetchWeather();
                });
              },
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitCircle(color: Colors.blue), // Loading spinner
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load weather data'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                } else {
                  var weather = snapshot.data!;
                  var condition = weather['current']['condition']['text'];
                  var iconCode = weather['current']['condition']['icon'];
                  var iconUrl = 'https:$iconCode'; // Weather icon URL

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weather in $selectedCity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.network(iconUrl, width: 100, height: 100), // Display weather icon
                        SizedBox(height: 20),
                        Text(
                          'Temperature: ${weather['current']['temp_c']}°C',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Condition: $condition',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Humidity: ${weather['current']['humidity']}%',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
