import 'package:flutter/material.dart';
import 'package:tourism_app_group_project/model/hotel.dart';
import '../providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';

class FavoriteIcon extends StatelessWidget {
  final Hotel hotel;

  FavoriteIcon({required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(hotel);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? AppColors.favoriteColor : Colors.grey,
      ),
      onPressed: () {
        favoriteProvider.toggleFavorite(hotel);
      },
    );
  }
}
