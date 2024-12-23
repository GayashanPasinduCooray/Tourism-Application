import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/weather_api_service.dart';

class SriLankaWeatherScreen extends StatefulWidget {
  @override
  _SriLankaWeatherScreenState createState() => _SriLankaWeatherScreenState();
}

class _SriLankaWeatherScreenState extends State<SriLankaWeatherScreen> {
  late Future<Map<String, dynamic>> weatherData;
  String selectedCity = 'Colombo'; // Default city

  final cities = [
    'Colombo', 'Kandy', 'Galle', 'Jaffna', 'Anuradhapura', 'Matara',
    'Trincomalee', 'Negombo', 'Ratnapura', 'Kurunegala', 'Batticaloa', 'Vavuniya',
  ];

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() {
    setState(() {
      weatherData = WeatherApiService().getWeather(selectedCity);
    });
  }

  Color _getBackgroundColor(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('sunny') || condition.contains('clear')) {
      return Colors.orange;
    } else if (condition.contains('rain')) {
      return Colors.blueGrey;
    } else if (condition.contains('cloud')) {
      return Colors.grey;
    } else if (condition.contains('snow')) {
      return Colors.lightBlue;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: SpinKitPulse(color: Colors.white));
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load weather data', style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
          } else {
            var weather = snapshot.data!;
            var condition = weather['current']['condition']['text'];
            var iconCode = weather['current']['condition']['icon'];
            var iconUrl = 'https:$iconCode';

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _getBackgroundColor(condition),
                    _getBackgroundColor(condition).withOpacity(0.6),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sri Lanka Weather',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          DropdownButton<String>(
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
                                child: Text(city, style: TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                            underline: Container(height: 2, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: Colors.white.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  selectedCity,
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Image.network(iconUrl, width: 100, height: 100),
                                SizedBox(height: 20),
                                Text(
                                  '${weather['current']['temp_c']}°C',
                                  style: GoogleFonts.poppins(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  condition,
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    WeatherInfoItem(
                                      icon: Icons.water_drop,
                                      label: 'Humidity',
                                      value: '${weather['current']['humidity']}%',
                                    ),
                                    WeatherInfoItem(
                                      icon: Icons.air,
                                      label: 'Wind',
                                      value: '${weather['current']['wind_kph']} km/h',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

