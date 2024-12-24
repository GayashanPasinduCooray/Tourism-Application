import 'package:flutter/material.dart';
import '../model/place.dart';
import '../providers/places_provider.dart';
import '../screens/favorite_places_screen.dart';
import '../screens/place_details_screen.dart';
import '../widgets/place_card.dart';

class FamousPlacesScreen extends StatefulWidget {
  @override
  _FamousPlacesScreenState createState() => _FamousPlacesScreenState();
}

class _FamousPlacesScreenState extends State<FamousPlacesScreen> {
  final placesProvider = PlacesProvider();

  @override
  void initState() {
    super.initState();
    loadPlaces();
  }

  /// Load places asynchronously and update the state
  Future<void> loadPlaces() async {
    await placesProvider.loadPlaces();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Place> places = placesProvider.getFamousPlaces();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Famous Places in Sri Lanka'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePlacesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: places.isEmpty
          ? const Center(
        child: Text(
          'No places to show!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return PlaceCard(
            place: places[index],
            onFavoriteToggle: () {
              setState(() {
                placesProvider.toggleFavorite(places[index]);
              });
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailsScreen(place: places[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
