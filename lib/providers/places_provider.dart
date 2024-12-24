import '../model/place.dart';
import '../db/db_helper_places.dart'; // Updated DB helper import

class PlacesProvider {
  List<Place> _famousPlaces = [
      Place(
        name: 'Sigiriya',
        description: '''Sigiriya, also known as Lion's Rock, is an ancient rock fortress located in the central Matale District of Sri Lanka. It is one of the island's most iconic landmarks and a UNESCO World Heritage Site. Rising 200 meters above the surrounding plains, Sigiriya offers stunning panoramic views of the lush landscape. 

The fortress complex includes impressive frescoes depicting celestial maidens, the Lion's Gate, and an array of water gardens that were designed with advanced ancient engineering techniques. The rock itself is believed to have served as a royal palace and a Buddhist monastery before becoming a stronghold during the reign of King Kashyapa in the 5th century. Today, Sigiriya remains a popular tourist destination, known for its rich historical and cultural significance.''',
        imageUrl: 'assets/images/places/sigiriya.jpg',
      ),
      Place(
        name: 'Galle Fort',
        description: '''Galle Fort, located on Sri Lanka's southwestern coast, is a historic colonial fort built by the Portuguese in the 16th century and later expanded by the Dutch in the 17th century. It stands as a living testament to Sri Lanka’s colonial past and is a UNESCO World Heritage Site. 

The fort is home to cobblestone streets, centuries-old churches, colonial buildings, and breathtaking views of the Indian Ocean. Visitors can explore numerous museums, the Dutch Reformed Church, and the iconic Galle Lighthouse. The fort is still inhabited and remains one of the best-preserved examples of European architecture in South Asia. Today, Galle Fort is a popular spot for shopping, dining, and exploring the rich history of the region.''',
        imageUrl: 'assets/images/places/galle_fort.jpg',
      ),
      Place(
        name: 'Ella',
        description: '''Ella is a small town located in the central highlands of Sri Lanka, surrounded by rolling hills, dense forests, and picturesque waterfalls. This peaceful destination is perfect for nature lovers and adventurers alike, offering trekking opportunities and stunning views. 

One of the most famous attractions in Ella is Ella Rock, a challenging yet rewarding hike that provides breathtaking views of the valley below. Another must-see is the Nine Arches Bridge, a remarkable feat of engineering set in a lush jungle landscape. The Ravana Falls, a beautiful multi-tiered waterfall, is another popular spot for visitors. Ella is also known for its tea plantations, where visitors can take guided tours to learn about Sri Lanka’s tea production process.''',
        imageUrl: 'assets/images/places/ella.jpg',
      ),
      Place(
        name: 'Temple of the Tooth',
        description: '''The Temple of the Tooth, also known as Sri Dalada Maligawa, is one of the most sacred Buddhist sites in the world. Located in the city of Kandy, it houses a tooth relic of the Buddha, which is highly revered by Buddhists around the globe. 

The temple, nestled within the Royal Palace complex, is an architectural marvel, featuring stunning Kandyan-style architecture. Pilgrims from all over the world visit this sacred site to pay their respects. The temple is also famous for the annual Esala Perahera, a grand festival that showcases traditional dances, drumming, and beautifully decorated elephants.''',
        imageUrl: 'assets/images/places/temple_of_the_tooth.jpg',
      ),
      Place(
        name: 'Nuwara Eliya',
        description: '''Nuwara Eliya, often referred to as "Little England," is a charming hill station situated in the heart of Sri Lanka’s tea-growing region. Known for its cool climate, colonial-style architecture, and lush green landscapes, Nuwara Eliya has been a popular getaway for both locals and tourists since the British colonial era. 

The town is surrounded by scenic tea plantations, and visitors can enjoy tours of tea factories to witness the tea-making process firsthand. Some of the top attractions in Nuwara Eliya include the Victoria Park, Gregory Lake, and the Nuwara Eliya Golf Course. The cooler temperatures and picturesque surroundings make it a great place to relax and enjoy the natural beauty of Sri Lanka.''',
        imageUrl: 'assets/images/places/nuwara_eliya.jpg',
      ),
      Place(
        name: 'Yala National Park',
        description: '''Yala National Park is one of Sri Lanka’s most famous and visited national parks, located in the southeastern part of the country. The park is renowned for its diverse wildlife, including the elusive Sri Lankan leopard, elephants, crocodiles, and a wide range of bird species. 

The park covers a vast area of 979 square kilometers and is divided into five blocks, each offering distinct ecosystems such as grasslands, forests, and wetlands. Visitors can embark on thrilling safari rides to observe wildlife in their natural habitat. Yala is also home to ancient Buddhist ruins, adding a cultural touch to the wildlife experience.''',
        imageUrl: 'assets/images/places/yala.jpg',
      ),
      Place(
        name: 'Dambulla Cave Temple',
        description: '''The Dambulla Cave Temple, also known as the Golden Temple of Dambulla, is one of Sri Lanka's most significant religious sites. Located atop a rock plateau, it consists of five caves containing over 150 Buddha statues, murals, and ancient religious paintings that date back to the 1st century BC. 

The temple is a masterpiece of ancient art and architecture, with each cave offering a unique atmosphere and a collection of intricate sculptures and paintings. Visitors to Dambulla will be struck by the serene atmosphere and the panoramic views of the surrounding countryside. The temple is an essential stop for those interested in Buddhist heritage and Sri Lankan history.''',
        imageUrl: 'assets/images/places/dambulla.jpg',
      ),
      Place(
        name: 'Horton Plains',
        description: '''Horton Plains National Park is a UNESCO World Heritage Site located in the central highlands of Sri Lanka. The park is known for its stunning landscapes, including vast grasslands, dense forests, and steep cliffs. One of its most famous features is World’s End, a sheer precipice that drops nearly 1,000 meters, offering an awe-inspiring view of the valley below. 

Horton Plains is home to various species of wildlife, including endemic bird species like the Sri Lanka Whistling Thrush and the Sri Lanka Junglefowl. The park is also known for its trekking trails, including the popular circular route that leads to World’s End. The cool, misty climate and natural beauty make Horton Plains a popular spot for eco-tourism and nature lovers.''',
        imageUrl: 'assets/images/places/horton_plains.jpg',
      ),
    ];

  Future<void> loadPlaces() async {
    final favoriteNames = await DBHelperPlaces.getFavorites(); // Updated DB helper method
    for (var place in _famousPlaces) {
      place.isFavorite = favoriteNames.contains(place.name);
    }
  }

  List<Place> getFamousPlaces() {
    return [..._famousPlaces];
  }

  void toggleFavorite(Place place) {
    place.isFavorite = !place.isFavorite;
    if (place.isFavorite) {
      DBHelperPlaces.addFavorite(place); // Updated DB helper method
    } else {
      DBHelperPlaces.removeFavorite(place.name); // Updated DB helper method
    }
  }

  List<Place> getFavoritePlaces() {
    return _famousPlaces.where((place) => place.isFavorite).toList();
  }
}