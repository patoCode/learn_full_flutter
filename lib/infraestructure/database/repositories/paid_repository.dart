import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_full_flutter/config/constants/constants.dart';
import 'package:learn_full_flutter/infraestructure/database/tables/paid_summary_table.dart';

class PaidRepository {
  final _box = Hive.box<PaidSummaryTable>(CommonsKeys.hiveBoxName);

  Future<void> save(PaidSummaryTable table) async {
    print("PRUEBA DE DATA ${table.id}");
    await _box.add(table);
  }

  List<PaidSummaryTable> getByTag(String tag) {
    return _box.values.where((item) => item.tag == tag).toList();
  }

  List<PaidSummaryTable> getAll() {
    return _box.values.toList();
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }
}
