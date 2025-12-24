// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateModel _$CalculateModelFromJson(Map<String, dynamic> json) =>
    CalculateModel(
      ammount: (json['ammount'] as num).toDouble(),
      people: (json['people'] as num).toInt(),
      percentaje: (json['percentaje'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      date: json['date'] as String,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$CalculateModelToJson(CalculateModel instance) =>
    <String, dynamic>{
      'ammount': instance.ammount,
      'people': instance.people,
      'percentaje': instance.percentaje,
      'total': instance.total,
      'date': instance.date,
      'tag': instance.tag,
    };
