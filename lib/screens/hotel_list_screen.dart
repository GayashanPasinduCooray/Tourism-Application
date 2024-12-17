import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import '../services/hotel_service.dart';
import '../widgets/hotel_card.dart';
import '../db/db_helper.dart';
import 'favorite_hotel_screen.dart';

class HotelListScreen extends StatefulWidget {
  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  List<Hotel> hotels = [];

  @override
  void initState() {
    super.initState();
    loadHotels();
  }

  Future<void> loadHotels() async {
    final favoriteHotels = await DBHelper.getFavorites();
    final allHotels = HotelService.getHotels();

    for (var hotel in allHotels) {
      hotel.isFavorite = favoriteHotels.any((fav) => fav.name == hotel.name);
    }

    setState(() {
      hotels = allHotels;
    });
  }

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
                MaterialPageRoute(
                  builder: (context) => FavoriteHotelScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(
            hotel: hotels[index],
            onFavoriteToggle: () => setState(() {}),
          );
        },
      ),
    );
  }
}
