// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RenovateHome {
  String imageSrc;
  String title;
  RenovateHome({
    required this.imageSrc,
    required this.title,
  });

  RenovateHome copyWith({
    String? imageSrc,
    String? title,
  }) {
    return RenovateHome(
      imageSrc: imageSrc ?? this.imageSrc,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageSrc': imageSrc,
      'title': title,
    };
  }

  factory RenovateHome.fromMap(Map<String, dynamic> map) {
    return RenovateHome(
      imageSrc: map['imageSrc'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RenovateHome.fromJson(String source) =>
      RenovateHome.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RenovateHome(imageSrc: $imageSrc, title: $title)';

  @override
  bool operator ==(covariant RenovateHome other) {
    if (identical(this, other)) return true;

    return other.imageSrc == imageSrc && other.title == title;
  }

  @override
  int get hashCode => imageSrc.hashCode ^ title.hashCode;
}
