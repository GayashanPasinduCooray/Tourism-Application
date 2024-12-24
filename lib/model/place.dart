class Place {
  final String name;
  final String description;
  final String imageUrl;
  bool isFavorite; // New field

  Place({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false, // Default value
  });
}
