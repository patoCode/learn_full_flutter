// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdResponse _$IdResponseFromJson(Map<String, dynamic> json) => IdResponse(
  response: json['response'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  powerstats: Powerstats.fromJson(json['powerstats'] as Map<String, dynamic>),
  biography: Biography.fromJson(json['biography'] as Map<String, dynamic>),
  appearance: Appearance.fromJson(json['appearance'] as Map<String, dynamic>),
  work: Work.fromJson(json['work'] as Map<String, dynamic>),
  connections: Connections.fromJson(
    json['connections'] as Map<String, dynamic>,
  ),
  image: Image.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IdResponseToJson(IdResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'id': instance.id,
      'name': instance.name,
      'powerstats': instance.powerstats,
      'biography': instance.biography,
      'appearance': instance.appearance,
      'work': instance.work,
      'connections': instance.connections,
      'image': instance.image,
    };

Appearance _$AppearanceFromJson(Map<String, dynamic> json) => Appearance(
  gender: json['gender'] as String,
  race: json['race'] as String,
  height: (json['height'] as List<dynamic>).map((e) => e as String).toList(),
  weight: (json['weight'] as List<dynamic>).map((e) => e as String).toList(),
  eyeColor: json['eyeColor'] as String,
  hairColor: json['hairColor'] as String,
);

Map<String, dynamic> _$AppearanceToJson(Appearance instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'race': instance.race,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hairColor': instance.hairColor,
    };

Biography _$BiographyFromJson(Map<String, dynamic> json) => Biography(
  fullName: json['fullName'] as String,
  alterEgos: json['alterEgos'] as String,
  aliases: (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
  placeOfBirth: json['placeOfBirth'] as String,
  firstAppearance: json['firstAppearance'] as String,
  publisher: json['publisher'] as String,
  alignment: json['alignment'] as String,
);

Map<String, dynamic> _$BiographyToJson(Biography instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'alterEgos': instance.alterEgos,
  'aliases': instance.aliases,
  'placeOfBirth': instance.placeOfBirth,
  'firstAppearance': instance.firstAppearance,
  'publisher': instance.publisher,
  'alignment': instance.alignment,
};

Connections _$ConnectionsFromJson(Map<String, dynamic> json) => Connections(
  groupAffiliation: json['groupAffiliation'] as String,
  relatives: json['relatives'] as String,
);

Map<String, dynamic> _$ConnectionsToJson(Connections instance) =>
    <String, dynamic>{
      'groupAffiliation': instance.groupAffiliation,
      'relatives': instance.relatives,
    };

Image _$ImageFromJson(Map<String, dynamic> json) =>
    Image(url: json['url'] as String);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'url': instance.url,
};

Powerstats _$PowerstatsFromJson(Map<String, dynamic> json) => Powerstats(
  intelligence: json['intelligence'] as String,
  strength: json['strength'] as String,
  speed: json['speed'] as String,
  durability: json['durability'] as String,
  power: json['power'] as String,
  combat: json['combat'] as String,
);

Map<String, dynamic> _$PowerstatsToJson(Powerstats instance) =>
    <String, dynamic>{
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'speed': instance.speed,
      'durability': instance.durability,
      'power': instance.power,
      'combat': instance.combat,
    };

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
  occupation: json['occupation'] as String,
  base: json['base'] as String,
);

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
  'occupation': instance.occupation,
  'base': instance.base,
};
