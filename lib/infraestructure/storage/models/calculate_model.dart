import 'package:json_annotation/json_annotation.dart';
import 'package:learn_full_flutter/infraestructure/storage/abstract/storage_model.dart';

part 'calculate_model.g.dart';

@JsonSerializable()
class CalculateModel implements StorageModel {
  final double ammount;
  final int people;
  final double percentaje;
  final double total;
  final String date;
  final String tag;

  CalculateModel({
    required this.ammount,
    required this.people,
    required this.percentaje,
    required this.total,
    required this.date,
    required this.tag,
  });

  @override
  Map<String, dynamic> toJson() => _$CalculateModelToJson(this);

  factory CalculateModel.fromJson(Map<String, dynamic> json) =>
      _$CalculateModelFromJson(json);
}
