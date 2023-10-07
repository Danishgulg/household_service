import 'dart:convert';

class HomeService {
  String imageSrc;
  String title;
  HomeService({
    required this.imageSrc,
    required this.title,
  });

  HomeService copyWith({
    String? imageSrc,
    String? title,
  }) {
    return HomeService(
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

  factory HomeService.fromMap(Map<String, dynamic> map) {
    return HomeService(
      imageSrc: map['imageSrc'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeService.fromJson(String source) =>
      HomeService.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeService(imageSrc: $imageSrc, title: $title)';

  @override
  bool operator ==(covariant HomeService other) {
    if (identical(this, other)) return true;

    return other.imageSrc == imageSrc && other.title == title;
  }

  @override
  int get hashCode => imageSrc.hashCode ^ title.hashCode;
}
