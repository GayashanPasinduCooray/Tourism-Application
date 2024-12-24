import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app_group_project/Services/currency_service.dart';
import 'package:tourism_app_group_project/providers/ThemeNotifier.dart';
import 'package:tourism_app_group_project/screens/favorite_hotel_screen.dart';
import 'package:tourism_app_group_project/screens/hotel_list_screen.dart';
import 'SriLankaWeatherScreen.dart';
import 'news_screen.dart';
import 'famous_places_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? usdToLkrRate;
  double? selectedRate;
  String selectedCurrency = 'LKR';

  @override
  void initState() {
    super.initState();
    _fetchExchangeRates();
  }

  _fetchExchangeRates() async {
    CurrencyService currencyService = CurrencyService();

    try {
      final rates = await currencyService.getExchangeRates();
      setState(() {
        usdToLkrRate = rates['conversion_rates']['LKR'].toDouble();
        selectedRate = usdToLkrRate;
      });
    } catch (e) {
      print("Error fetching exchange rates: $e");
    }
  }

  void _updateSelectedCurrency(String currency) {
    setState(() {
      selectedCurrency = currency;
      selectedRate = usdToLkrRate!;
    });
  }


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    Color textColor = themeNotifier.listTileTextColor;
    Color iconColor = themeNotifier.listTileIconColor;

    return Scaffold(
      appBar: AppBar(

        title: Text(
          'Sri Lanka Tourism',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: themeNotifier.appBarColor,

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: themeNotifier.drawerHeaderColor,
              ),
              child: Text(
                'Travel App Menu',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.place, color: iconColor),
              title: Text('Famous Places', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FamousPlacesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.hotel, color: iconColor),
              title: Text('Hotels', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelListScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper, color: iconColor),
              title: Text('News', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud, color: iconColor),
              title: Text('Sri Lanka Weather', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SriLankaWeatherScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: iconColor),
              title: Text('Settings', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image Banner
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sri_lanka_banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Welcome Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
              child: Text(
                'Welcome to Sri Lanka Tourism!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            // Currency Exchange Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.greenAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Currency Exchange',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 12),
                        if (usdToLkrRate != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1 USD = ${usdToLkrRate!.toStringAsFixed(2)} LKR',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              DropdownButton<String>(
                                value: selectedCurrency,
                                items: [
                                  DropdownMenuItem(
                                    value: 'LKR',
                                    child: Text(
                                      'LKR (Sri Lankan Rupee)',
                                      style: TextStyle(
                                        color: isDarkMode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'USD',
                                    child: Text(
                                      'USD (US Dollar)',
                                      style: TextStyle(
                                        color: isDarkMode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    _updateSelectedCurrency(value);
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Converted Amount: ${(selectedRate! * 100).toStringAsFixed(2)} $selectedCurrency',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          )
                        else
                          Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Quick Access Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Access',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuickAccessItem(
                        icon: Icons.place,
                        label: 'Famous Places',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FamousPlacesScreen()),
                          );
                        },
                      ),
                      QuickAccessItem(
                        icon: Icons.cloud,
                        label: 'Weather',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SriLankaWeatherScreen()),
                          );
                        },
                      ),
                      QuickAccessItem(
                        icon: Icons.newspaper,
                        label: 'News',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Section: Explore Famous Places (already existing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Famous Places',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PlaceCard(
                          placeName: 'Sigiriya',
                          imageUrl: 'assets/images/places/sigiriya.jpg',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FamousPlacesScreen()),
                            );
                          },
                        ),
                        PlaceCard(
                          placeName: 'Galle Fort',
                          imageUrl: 'assets/images/places/galle_fort.jpg',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FamousPlacesScreen()),
                            );
                          },
                        ),
                        PlaceCard(
                          placeName: 'Ella',
                          imageUrl: 'assets/images/places/ella.jpg',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FamousPlacesScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  QuickAccessItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isDarkMode ? Colors.white : Colors.blueAccent,
            radius: 30,
            child: Icon(
              icon,
              color: isDarkMode ? Colors.black : Colors.white,
              size: 30,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;
  final Function onTap;

  PlaceCard({required this.placeName, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Image.asset(imageUrl, width: 150, height: 100, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  placeName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}