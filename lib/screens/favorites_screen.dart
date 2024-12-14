import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of favorite places
    final favoritePlaces = ['Sigiriya', 'Galle Fort', 'Ella'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(favoritePlaces[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle removal from favorites
              },
            ),
          );
        },
      ),
    );
  }
}
