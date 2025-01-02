import 'package:tourism_app_group_project/model/hotel.dart';


class HotelService {
  static List<Hotel> getHotels() {
    return [
      Hotel(
        name: 'Galle Face Hotel',
        description: '''A historic hotel with stunning ocean views. Enjoy a luxurious stay with world-class services, and dine at the beachfront restaurant offering local and international cuisine.
        
        Buffet Price: LKR 3500 per person
        Buffet Time: 12:00 PM - 3:00 PM
        
        Additional Info: Outdoor swimming pool, Spa, and direct beach access.''',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/galle_face.jpg',
      ) as Hotel,
      Hotel(
        name: 'Heritance Kandalama',
        description: '''A luxurious eco-friendly hotel near Sigiriya. A perfect blend of modern luxury and nature, located by the Kandalama lake with views of the Sigiriya rock.
        
        Buffet Price: LKR 4000 per person
        Buffet Time: 1:00 PM - 4:00 PM
        
        Additional Info: Eco-friendly architecture, nature walks, and Sri Lankan cultural experiences.''',
        location: 'Dambulla',
        imageAssetPath: 'assets/images/hotels/kandalama.jpg',
      ) as Hotel,
      Hotel(
        name: 'Shangri-La Hotel',
        description: '''Modern luxury in the heart of Colombo. A high-end hotel featuring spacious rooms, a wellness center, and exquisite dining options.
        
        Buffet Price: LKR 5000 per person
        Buffet Time: 12:30 PM - 2:30 PM
        
        Additional Info: Luxury spa, rooftop pool with panoramic views, and gourmet restaurants.''',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/shangri_la.jpg',
      ),
      Hotel(
        name: 'Cinnamon Lodge',
        description: '''A serene getaway surrounded by nature. Located in Habarana, this peaceful hotel offers an immersive experience in Sri Lanka's rich culture.
        
        Buffet Price: LKR 4500 per person
        Buffet Time: 1:00 PM - 4:00 PM
        
        Additional Info: Spa services, nature walks, and cultural tours to nearby ancient ruins.''',
        location: 'Habarana',
        imageAssetPath: 'assets/images/hotels/cinnamon_lodge.jpg',
      ) as Hotel,
      Hotel(
        name: 'Jetwing Vil Uyana',
        description: '''An eco-luxury retreat blending with nature. Enjoy the beautiful surroundings of Sigiriya with luxury villas built into a wetland sanctuary.
        
        Buffet Price: LKR 4200 per person
        Buffet Time: 12:00 PM - 3:00 PM
        
        Additional Info: Private pools, eco tours, and bird watching.''',
        location: 'Sigiriya',
        imageAssetPath: 'assets/images/hotels/vil_uyana.jpg',
      ) as Hotel,
      Hotel(
        name: 'Anantara Peace Haven Tangalle',
        description: '''A beachfront paradise for relaxation. This luxury resort offers a peaceful escape with ocean views and holistic wellness treatments.
        
        Buffet Price: LKR 6000 per person
        Buffet Time: 1:00 PM - 3:00 PM
        
        Additional Info: Beachfront dining, yoga and meditation, and luxury spa.''',
        location: 'Tangalle',
        imageAssetPath: 'assets/images/hotels/anantara.jpg',
      ) as Hotel,
      Hotel(
        name: 'Amaya Hills',
        description: '''A hilltop retreat with panoramic views. Located in Kandy, this resort offers a peaceful atmosphere with views of the surrounding mountains.
        
        Buffet Price: LKR 5000 per person
        Buffet Time: 12:30 PM - 2:30 PM
        
        Additional Info: Cultural experiences, nature trails, and mountain view rooms.''',
        location: 'Kandy',
        imageAssetPath: 'assets/images/hotels/amaya_hills.jpg',
      ) as Hotel,
      Hotel(
        name: 'The Fortress Resort & Spa',
        description: '''A luxury beachfront resort in Galle. A tranquil resort offering top-tier amenities and a perfect blend of luxury and nature.
        
        Buffet Price: LKR 5500 per person
        Buffet Time: 1:00 PM - 3:00 PM
        
        Additional Info: Beachfront access, spa, and Ayurveda treatments.''',
        location: 'Galle',
        imageAssetPath: 'assets/images/hotels/fortress.jpg',
      ) as Hotel,
      Hotel(
        name: 'Araliya Green City',
        description: '''A stylish hotel in the cool climate of Nuwara Eliya. Offers a modern stay with lush green surroundings, perfect for a peaceful retreat.
        
        Buffet Price: LKR 4800 per person
        Buffet Time: 1:00 PM - 4:00 PM
        
        Additional Info: Tea plantations tours, garden views, and luxury wellness facilities.''',
        location: 'Nuwara Eliya',
        imageAssetPath: 'assets/images/hotels/araliya_green.jpg',
      ) as Hotel,
      Hotel(
        name: 'Marino Beach Colombo',
        description: '''A modern hotel with an infinity pool overlooking the ocean. Located in Colombo, this hotel offers stunning views and luxurious amenities.
        
        Buffet Price: LKR 5200 per person
        Buffet Time: 12:00 PM - 3:00 PM
        
        Additional Info: Infinity pool, rooftop bar, and fitness center.''',
        location: 'Colombo',
        imageAssetPath: 'assets/images/hotels/marino.jpg',
      ) as Hotel,
      Hotel(
        name: 'Wild Coast Tented Lodge',
        description:  '''A unique safari experience near Yala National Park. Stay in luxury tents surrounded by nature for a thrilling safari experience.
        
        Buffet Price: LKR 6000 per person
        Buffet Time: 12:00 PM - 3:00 PM
        
        Additional Info: Safari tours, wildlife photography, and star-gazing experiences.''',
        location: 'Yala',
        imageAssetPath: 'assets/images/hotels/wild_coast.jpg',
      ) as Hotel,
      Hotel(
        name: 'Chena Huts by Uga Escapes',
        description: '''A luxury safari lodge blending comfort with wilderness. Located near Yala, enjoy a unique stay with world-class amenities and thrilling safaris.
        
        Buffet Price: LKR 6500 per person
        Buffet Time: 1:00 PM - 4:00 PM
        
        Additional Info: Safari experiences, private plunge pools, and exclusive dining options.''',
        location: 'Yala',
        imageAssetPath: 'assets/images/hotels/chena_huts.jpg',
      ) as Hotel,
    ];
  }
}
