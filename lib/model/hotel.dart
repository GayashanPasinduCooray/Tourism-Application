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
}
