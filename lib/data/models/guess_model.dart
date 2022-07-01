import 'package:bukit_vista_flutter_assessment/data/models/booking_model.dart';
import 'package:bukit_vista_flutter_assessment/domain/entities/guess.dart';

class GuessModel {
  const GuessModel({
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
  final List<BookingModel> booking;

  factory GuessModel.fromJson(Map<String, dynamic> json) {
    return GuessModel(
      name: json['name'] as String,
      imgUrl: json['img_url'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as int,
      guessSince: DateTime.parse(json['guest_since'] as String),
      booking: (json['bookings'] as List)
          .map((x) => BookingModel.fromJson(x))
          .toList(),
    );
  }

  Guess toEntity() {
    return Guess(
      name: name,
      imgUrl: imgUrl,
      location: location,
      email: email,
      phoneNumber: phoneNumber,
      guessSince: guessSince,
      booking: booking.map((x) => x.toEntity()).toList(),
    );
  }
}
