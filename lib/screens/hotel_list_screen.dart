import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import '../services/hotel_service.dart';
import '../widgets/hotel_card.dart';
import 'favorite_hotel_screen.dart';

class HotelListScreen extends StatelessWidget {
  final List<Hotel> hotels = HotelService.getHotels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Hotels in Sri Lanka'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteHotelScreen(hotels: hotels)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: hotels[index]);
        },
      ),
    );
  }
}

