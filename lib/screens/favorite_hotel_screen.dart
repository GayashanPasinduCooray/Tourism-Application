import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/db/db_helper.dart';
import 'package:tourism_app_group_project/widgets/hotel_card.dart';
import 'package:tourism_app_group_project/model/hotel.dart';

class FavoriteHotelScreen extends StatefulWidget {
  @override
  _FavoriteHotelScreenState createState() => _FavoriteHotelScreenState();
}

class _FavoriteHotelScreenState extends State<FavoriteHotelScreen> {
  List<Hotel> favoriteHotels = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favorites = await DBHelper.getFavorites();
    setState(() {
      favoriteHotels = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Hotels'),
      ),
      body: favoriteHotels.isEmpty
          ? Center(child: Text('No favorite hotels yet!'))
          : ListView.builder(
        itemCount: favoriteHotels.length,
        itemBuilder: (context, index) {
          return HotelCard(
            hotel: favoriteHotels[index],
            onFavoriteToggle: () => loadFavorites(),
          );
        },
      ),
    );
  }
}
