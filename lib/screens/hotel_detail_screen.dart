import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class HotelDetailsScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);

  // Function to launch Google Maps with the hotel's name
  Future<void> _launchGoogleMaps(String name) async {
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$name");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl); // Open Google Maps with the hotel name
    } else {
      throw 'Could not open Google Maps for $name';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Image
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(hotel.imageAssetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Hotel Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel Name
                  Text(
                    hotel.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Hotel Location
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Text(
                        hotel.location,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Hotel Description
                  Text(
                    hotel.description,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  // View on Google Maps Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Call the method to search hotel name on Google Maps
                        _launchGoogleMaps(hotel.name);
                      },
                      icon: Icon(Icons.map),
                      label: Text('View on Google Maps'),
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
