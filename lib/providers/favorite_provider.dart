import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Hotel> _favoriteHotels = [];

  List<Hotel> get favoriteHotels => _favoriteHotels;

  void toggleFavorite(Hotel hotel) {
    if (_favoriteHotels.contains(hotel)) {
      _favoriteHotels.remove(hotel);
    } else {
      _favoriteHotels.add(hotel);
    }
    notifyListeners();
  }

  bool isFavorite(Hotel hotel) {
    return _favoriteHotels.contains(hotel);
  }
}
