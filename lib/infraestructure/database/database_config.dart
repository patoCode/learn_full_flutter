import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_full_flutter/config/constants/constants.dart';
import 'package:learn_full_flutter/infraestructure/database/tables/paid_summary_table.dart';

class DatabaseConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PaidSummaryTableAdapter());
    await Hive.openBox<PaidSummaryTable>(CommonsKeys.hiveBoxName);
  }
}
