import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import '../widgets/hotel_card.dart';

class FavoriteHotelScreen extends StatelessWidget {
  final List<Hotel> hotels;

  const FavoriteHotelScreen({Key? key, required this.hotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteHotels = hotels.where((hotel) => hotel.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Hotels'),
      ),
      body: favoriteHotels.isEmpty
          ? Center(child: Text('No favorite hotels yet.'))
          : ListView.builder(
        itemCount: favoriteHotels.length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: favoriteHotels[index]);
        },
      ),
    );
  }
}
