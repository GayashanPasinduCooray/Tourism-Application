import 'package:flutter/material.dart';
import '../providers/places_provider.dart';
import '../widgets/place_card.dart';

class FavoritePlacesScreen extends StatefulWidget {
  @override
  _FavoritePlacesScreenState createState() => _FavoritePlacesScreenState();
}

class _FavoritePlacesScreenState extends State<FavoritePlacesScreen> {
  final placesProvider = PlacesProvider();

  @override
  void initState() {
    super.initState();
    loadFavoritePlaces();
  }

  // Load the favorite places
  Future<void> loadFavoritePlaces() async {
    await placesProvider.loadPlaces();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlaces = placesProvider.getFavoritePlaces();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Places'),
      ),
      body: favoritePlaces.isEmpty
          ? const Center(
        child: Text(
          'No favorite places!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) {
          return PlaceCard(
            place: favoritePlaces[index],
            onFavoriteToggle: () {
              setState(() {
                placesProvider.toggleFavorite(favoritePlaces[index]);
              });
            },
            onTap: () {
              // You can navigate to the details of the place, if needed
            },
          );
        },
      ),
    );
  }
}
