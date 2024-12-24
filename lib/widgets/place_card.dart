import 'package:flutter/material.dart';
import '../model/place.dart';

class PlaceCard extends StatelessWidget {
  final Place place;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  PlaceCard({
    required this.place,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to the details screen when tapped
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Displaying the image with a fallback for errors
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'No Image Available',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Displaying title, description, and the favorite button
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                place.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                place.description,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: Icon(
                  place.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: place.isFavorite ? Colors.red : null,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
