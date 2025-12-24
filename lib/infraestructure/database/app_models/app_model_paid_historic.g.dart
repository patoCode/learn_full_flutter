// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model_paid_historic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModelPaidHistoric _$AppModelPaidHistoricFromJson(
        Map<String, dynamic> json) =>
    AppModelPaidHistoric(
      id: json['id'] as String,
      ammount: (json['ammount'] as num).toDouble(),
      qtyPeoples: (json['qtyPeoples'] as num).toDouble(),
      tip: (json['tip'] as num).toDouble(),
      totalIndividual: (json['totalIndividual'] as num).toDouble(),
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$AppModelPaidHistoricToJson(
        AppModelPaidHistoric instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ammount': instance.ammount,
      'qtyPeoples': instance.qtyPeoples,
      'tip': instance.tip,
      'totalIndividual': instance.totalIndividual,
      'createAt': instance.createAt.toIso8601String(),
    };
