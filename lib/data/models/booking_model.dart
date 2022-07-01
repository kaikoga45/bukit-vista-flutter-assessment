import '../../domain/entities/booking.dart';

class BookingModel {
  const BookingModel({
    required this.id,
    required this.placeName,
    required this.status,
    required this.dateCheckIn,
    required this.dateCheckOut,
  });

  final String id;
  final String placeName;
  final String status;
  final DateTime dateCheckIn;
  final DateTime dateCheckOut;

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String,
      placeName: json['place_name'] as String,
      status: json['status'] as String,
      dateCheckIn: DateTime.parse(json['check_in'] as String),
      dateCheckOut: DateTime.parse(json['check_out'] as String),
    );
  }

  Booking toEntity() {
    return Booking(
      id: id,
      placeName: placeName,
      status: status,
      checkIn: dateCheckIn,
      checkOut: dateCheckOut,
    );
  }
}
