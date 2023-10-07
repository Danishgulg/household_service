import 'dart:convert';

class HomeConstruction {
  String imageSrc;
  String title;
  HomeConstruction({
    required this.imageSrc,
    required this.title,
  });

  HomeConstruction copyWith({
    String? imageSrc,
    String? title,
  }) {
    return HomeConstruction(
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

  factory HomeConstruction.fromMap(Map<String, dynamic> map) {
    return HomeConstruction(
      imageSrc: map['imageSrc'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeConstruction.fromJson(String source) =>
      HomeConstruction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeConstruction(imageSrc: $imageSrc, title: $title)';

  @override
  bool operator ==(covariant HomeConstruction other) {
    if (identical(this, other)) return true;

    return other.imageSrc == imageSrc && other.title == title;
  }

  @override
  int get hashCode => imageSrc.hashCode ^ title.hashCode;
}
