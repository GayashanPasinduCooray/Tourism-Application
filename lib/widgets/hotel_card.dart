import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import 'package:tourism_app_group_project/db/db_helper.dart';
import '../screens/hotel_detail_screen.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  final VoidCallback onFavoriteToggle;

  const HotelCard({
    Key? key,
    required this.hotel,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotel: hotel),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hotel.imageAssetPath.isNotEmpty
                ? Image.asset(
              hotel.imageAssetPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            )
                : SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'No Image Available',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hotel.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey[600], size: 16),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      hotel.location,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  hotel.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: hotel.isFavorite ? Colors.red : null,
                ),
                onPressed: () async {
                  if (hotel.isFavorite) {
                    await DBHelper.removeFavorite(hotel.name);
                  } else {
                    await DBHelper.addFavorite(hotel);
                  }

                  hotel.isFavorite = !hotel.isFavorite;
                  onFavoriteToggle();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
