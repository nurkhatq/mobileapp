class Salon {
  final String id;
  final String name;
  final String categoryId;
  final String address;
  final String city;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final List<String> services;
  final String description;
  final bool isPromoted;
  final String phoneNumber;
  final Map<String, String> workingHours;

  Salon({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.address,
    required this.city,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.services,
    required this.description,
    this.isPromoted = false,
    required this.phoneNumber,
    required this.workingHours,
  });
}
