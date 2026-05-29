class BookingModel {
  final int id;
  final String hotelName;
  final String location;
  final String date;
  final String status;
  final String bookingType;
  final String image;

  BookingModel({
    required this.id,
    required this.hotelName,
    required this.location,
    required this.date,
    required this.status,
    required this.bookingType,
    required this.image,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      hotelName: json['hotel_name'],
      location: json['location'],
      date: json['date'],
      status: json['status'],
      bookingType: json['booking_type'],
      image: json['image'],
    );
  }
}
