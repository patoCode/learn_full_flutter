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
  ImageResponse image;

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

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
    gender: json["gender"] ?? '',
    race: json["race"] ?? '',
    height: List<String>.from(json["height"] ?? []),
    weight: List<String>.from(json["weight"] ?? []),
    eyeColor: json["eye-color"] ?? '',
    hairColor: json["hair-color"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "race": race,
    "height": List<dynamic>.from(height.map((x) => x)),
    "weight": List<dynamic>.from(weight.map((x) => x)),
    "eye-color": eyeColor,
    "hair-color": hairColor,
  };
}

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

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
    fullName: json["full-name"] ?? '',
    alterEgos: json["alter-egos"] ?? '',
    aliases: List<String>.from(json["aliases"] ?? []),
    placeOfBirth: json["place-of-birth"] ?? '',
    firstAppearance: json["first-appearance"] ?? '',
    publisher: json["publisher"] ?? '',
    alignment: json["alignment"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "full-name": fullName,
    "alter-egos": alterEgos,
    "aliases": List<dynamic>.from(aliases.map((x) => x)),
    "place-of-birth": placeOfBirth,
    "first-appearance": firstAppearance,
    "publisher": publisher,
    "alignment": alignment,
  };
}

@JsonSerializable()
class Connections {
  String groupAffiliation;
  String relatives;

  Connections({required this.groupAffiliation, required this.relatives});
  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
    groupAffiliation: json["group-affiliation"] ?? '',
    relatives: json["relatives"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "group-affiliation": groupAffiliation,
    "relatives": relatives,
  };
}

@JsonSerializable()
class ImageResponse {
  String url;

  ImageResponse({required this.url});
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
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
