import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/place.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  PlaceDetailsScreen({required this.place});

  // Launch Google Maps
  void _openGoogleMaps(String location) async {
    final Uri googleMapUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$location");
    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl);
    } else {
      throw 'Could not launch $googleMapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        'Image not available',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _openGoogleMaps(place.name),
                    icon: Icon(Icons.map),
                    label: Text('View on Google Maps'),
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
