import 'package:json_annotation/json_annotation.dart';
import 'package:learn_full_flutter/infraestructure/database/tables/paid_summary_table.dart';

part 'app_model_paid_historic.g.dart';

@JsonSerializable()
class AppModelPaidHistoric {
  final String id;
  final double ammount;
  final double qtyPeoples;
  final double tip;
  final double totalIndividual;
  final DateTime createAt;

  AppModelPaidHistoric({
    required this.id,
    required this.ammount,
    required this.qtyPeoples,
    required this.tip,
    required this.totalIndividual,
    required this.createAt,
  });

  Map<String, dynamic> toJson() => _$AppModelPaidHistoricToJson(this);
  factory AppModelPaidHistoric.fromJson(Map<String, dynamic> json) =>
      _$AppModelPaidHistoricFromJson(json);

  PaidSummaryTable toTableEntity(String tag) {
    return PaidSummaryTable()
      ..id = id
      ..ammount = ammount
      ..people = qtyPeoples.toInt()
      ..percentaje = tip
      ..total = totalIndividual
      ..date = createAt
      ..tag = tag;
  }

  AppModelPaidHistoric.fromTableEntity(PaidSummaryTable table)
    : id = table.id.toString(),
      ammount = table.ammount,
      qtyPeoples = table.people.toDouble(),
      tip = table.percentaje,
      totalIndividual = table.total,
      createAt = table.date;
}
