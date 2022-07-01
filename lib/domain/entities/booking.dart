class Booking {
  const Booking({
    required this.id,
    required this.placeName,
    required this.status,
    required this.checkIn,
    required this.checkOut,
  });

  final String id;
  final String placeName;
  final String status;
  final DateTime checkIn;
  final DateTime checkOut;
}
