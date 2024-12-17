class Hotel {
  final String name;
  final String description;
  final String location;
  final String imageAssetPath;
  bool isFavorite;

  Hotel({
    required this.name,
    required this.description,
    required this.location,
    required this.imageAssetPath,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'imageAssetPath': imageAssetPath,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      name: map['name'],
      description: map['description'],
      location: map['location'],
      imageAssetPath: map['imageAssetPath'],
      isFavorite: true,
    );
  }
}
