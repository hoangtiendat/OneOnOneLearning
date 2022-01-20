import 'booking.dart';

class BookingTutor {
  String? message;
  List<Booking>? data;

  BookingTutor({this.message, this.data});

  BookingTutor.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Booking>[];
      json['data'].forEach((v) {
        data!.add(Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
