import 'package:hive/hive.dart';

part 'paid_summary_table.g.dart';

@HiveType(typeId: 0)
class PaidSummaryTable extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late double ammount;
  @HiveField(2)
  late int people;
  @HiveField(3)
  late double percentaje;
  @HiveField(4)
  late double total;
  @HiveField(5)
  late DateTime date;
  @HiveField(6)
  late String tag;
}
