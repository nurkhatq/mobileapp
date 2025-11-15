class Master {
  final String id;
  final String name;
  final String photoUrl;
  final double rating;
  final int reviewCount;
  final String specialization;
  final List<String> serviceIds;
  final int experienceYears;
  final String bio;

  Master({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.rating,
    required this.reviewCount,
    required this.specialization,
    required this.serviceIds,
    required this.experienceYears,
    required this.bio,
  });
}

class Service {
  final String id;
  final String name;
  final int durationMinutes;
  final double price;
  final String description;
  final String categoryId;

  Service({
    required this.id,
    required this.name,
    required this.durationMinutes,
    required this.price,
    required this.description,
    required this.categoryId,
  });
}

class TimeSlot {
  final DateTime dateTime;
  final bool isAvailable;

  TimeSlot({
    required this.dateTime,
    required this.isAvailable,
  });
}

class Booking {
  final String id;
  final String salonId;
  final String masterId;
  final String serviceId;
  final DateTime dateTime;
  final BookingStatus status;
  final String clientName;
  final String clientPhone;

  Booking({
    required this.id,
    required this.salonId,
    required this.masterId,
    required this.serviceId,
    required this.dateTime,
    required this.status,
    required this.clientName,
    required this.clientPhone,
  });
}

enum BookingStatus {
  upcoming,
  completed,
  cancelled,
}
