import 'booking.dart';

class Guess {
  const Guess({
    required this.name,
    required this.imgUrl,
    required this.location,
    required this.email,
    required this.phoneNumber,
    required this.guessSince,
    required this.booking,
  });

  final String name;
  final String imgUrl;
  final String location;
  final String email;
  final int phoneNumber;
  final DateTime guessSince;
  final List<Booking> booking;
}
