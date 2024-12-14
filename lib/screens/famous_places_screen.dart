import 'package:flutter/material.dart';
import '../model/place.dart';
import '../providers/places_provider.dart';
import '../screens/place_details_screen.dart';
import '../widgets/place_card.dart';

class FamousPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final placesProvider = PlacesProvider();
    final List<Place> places = placesProvider.getFamousPlaces();

    return Scaffold(
      appBar: AppBar(
        title: Text('Famous Places in Sri Lanka'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailsScreen(place: places[index]),
                ),
              );
            },
            child: PlaceCard(place: places[index]),
          );
        },
      ),
    );
  }
}
