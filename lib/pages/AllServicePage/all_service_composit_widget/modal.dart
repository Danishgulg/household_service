// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeService {
  String timeOfPost;
  String serviceType;
  String employeeName;
  double bookingPrice;
  String currency;
  String description;
  EmployeeService({
    required this.timeOfPost,
    required this.serviceType,
    required this.employeeName,
    required this.bookingPrice,
    required this.currency,
    required this.description,
  });

  EmployeeService copyWith({
    String? timeOfPost,
    String? serviceType,
    String? employeeName,
    double? bookingPrice,
    String? currency,
    String? description,
  }) {
    return EmployeeService(
      timeOfPost: timeOfPost ?? this.timeOfPost,
      serviceType: serviceType ?? this.serviceType,
      employeeName: employeeName ?? this.employeeName,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      currency: currency ?? this.currency,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeOfPost': timeOfPost,
      'serviceType': serviceType,
      'employeeName': employeeName,
      'bookingPrice': bookingPrice,
      'currency': currency,
      'description': description,
    };
  }

  factory EmployeeService.fromMap(Map<String, dynamic> map) {
    return EmployeeService(
      timeOfPost: map['timeOfPost'] as String,
      serviceType: map['serviceType'] as String,
      employeeName: map['employeeName'] as String,
      bookingPrice: map['bookingPrice'] as double,
      currency: map['currency'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeService.fromJson(String source) =>
      EmployeeService.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeService(timeOfPost: $timeOfPost, serviceType: $serviceType, employeeName: $employeeName, bookingPrice: $bookingPrice, currency: $currency, description: $description)';
  }

  @override
  bool operator ==(covariant EmployeeService other) {
    if (identical(this, other)) return true;

    return other.timeOfPost == timeOfPost &&
        other.serviceType == serviceType &&
        other.employeeName == employeeName &&
        other.bookingPrice == bookingPrice &&
        other.currency == currency &&
        other.description == description;
  }

  @override
  int get hashCode {
    return timeOfPost.hashCode ^
        serviceType.hashCode ^
        employeeName.hashCode ^
        bookingPrice.hashCode ^
        currency.hashCode ^
        description.hashCode;
  }
}
