import 'package:json_annotation/json_annotation.dart';

part 'id_response.g.dart';

@JsonSerializable()
class IdResponse {
  String response;
  String id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  Image image;

  IdResponse({
    required this.response,
    required this.id,
    required this.name,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$IdResponseToJson(this);
  factory IdResponse.fromJson(Map<String, dynamic> json) =>
      _$IdResponseFromJson(json);
}

@JsonSerializable()
class Appearance {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });
  Map<String, dynamic> toJson() => _$AppearanceToJson(this);
  factory Appearance.fromJson(Map<String, dynamic> json) =>
      _$AppearanceFromJson(json);
}

@JsonSerializable()
class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });
  Map<String, dynamic> toJson() => _$BiographyToJson(this);
  factory Biography.fromJson(Map<String, dynamic> json) =>
      _$BiographyFromJson(json);
}

@JsonSerializable()
class Connections {
  String groupAffiliation;
  String relatives;

  Connections({required this.groupAffiliation, required this.relatives});

  Map<String, dynamic> toJson() => _$ConnectionsToJson(this);
  factory Connections.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsFromJson(json);
}

@JsonSerializable()
class Image {
  String url;

  Image({required this.url});
  Map<String, dynamic> toJson() => _$ImageToJson(this);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@JsonSerializable()
class Powerstats {
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  Map<String, dynamic> toJson() => _$PowerstatsToJson(this);
  factory Powerstats.fromJson(Map<String, dynamic> json) =>
      _$PowerstatsFromJson(json);
}

@JsonSerializable()
class Work {
  String occupation;
  String base;

  Work({required this.occupation, required this.base});

  Map<String, dynamic> toJson() => _$WorkToJson(this);
  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
}
