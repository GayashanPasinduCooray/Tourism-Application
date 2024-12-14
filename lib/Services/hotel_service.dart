import 'package:tourism_app_group_project/model/hotel.dart';


class HotelService {
  static List<Hotel> getHotels() {
    return [
      Hotel(
        name: 'Galle Face Hotel',
        description: 'A historic hotel with stunning ocean views.',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/galle_face.jpg',
      ) as Hotel,
      Hotel(
        name: 'Heritance Kandalama',
        description: 'A luxurious eco-friendly hotel near Sigiriya.',
        location: 'Dambulla',
        imageAssetPath: 'assets/images/hotels/kandalama.jpg',
      ) as Hotel,
      Hotel(
        name: 'Shangri-La Hotel',
        description: 'Modern luxury in the heart of Colombo.',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/shangri_la.jpg',
      ),
      Hotel(
        name: 'Cinnamon Lodge',
        description: 'A serene getaway surrounded by nature.',
        location: 'Habarana',
        imageAssetPath: 'assets/images/hotels/cinnamon_lodge.jpg',
      ) as Hotel,
      Hotel(
        name: 'Jetwing Vil Uyana',
        description: 'An eco-luxury retreat blending with nature.',
        location: 'Sigiriya',
        imageAssetPath: 'assets/images/hotels/vil_uyana.jpg',
      ) as Hotel,
      Hotel(
        name: 'Anantara Peace Haven Tangalle',
        description: 'A beachfront paradise for relaxation.',
        location: 'Tangalle',
        imageAssetPath: 'assets/images/hotels/anantara.jpg',
      ) as Hotel,
      Hotel(
        name: 'Amaya Hills',
        description: 'A hilltop retreat with panoramic views.',
        location: 'Kandy',
        imageAssetPath: 'assets/images/hotels/amaya_hills.jpg',
      ) as Hotel,
      Hotel(
        name: 'The Fortress Resort & Spa',
        description: 'A luxury beachfront resort in Galle.',
        location: 'Galle',
        imageAssetPath: 'assets/images/hotels/fortress.jpg',
      ) as Hotel,
      Hotel(
        name: 'Araliya Green City',
        description: 'A stylish hotel in the cool climate of Nuwara Eliya.',
        location: 'Nuwara Eliya',
        imageAssetPath: 'assets/images/hotels/araliya_green.jpg',
      ) as Hotel,
      Hotel(
        name: 'Marino Beach Colombo',
        description: 'A modern hotel with an infinity pool overlooking the ocean.',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/marino.jpg',
      ) as Hotel,
      Hotel(
        name: 'Wild Coast Tented Lodge',
        description: 'A unique safari experience near Yala National Park.',
        location: 'Yala',
        imageAssetPath: 'assets/images/hotels/wild_coast.jpg',
      ) as Hotel,
      Hotel(
        name: 'Chena Huts by Uga Escapes',
        description: 'A luxury safari lodge blending comfort with wilderness.',
        location: 'Yala',
        imageAssetPath: 'assets/images/hotels/chena_huts.jpg',
      ) as Hotel,
    ];
  }
}
