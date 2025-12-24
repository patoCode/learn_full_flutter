import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_full_flutter/config/constants/constants.dart';
import 'package:learn_full_flutter/config/helpers/utils.dart';
import 'package:learn_full_flutter/infraestructure/database/app_models/app_model_paid_historic.dart';
import 'package:learn_full_flutter/infraestructure/database/tables/paid_summary_table.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 380,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("HISTORICO"),
              const Divider(),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<PaidSummaryTable>(
                    CommonsKeys.hiveBoxName,
                  ).listenable(),
                  builder: (context, Box<PaidSummaryTable> box, _) {
                    if (box.values.isEmpty) {
                      return Text('No hay historico aun');
                    }
                    final history = box.values
                        .toList()
                        .cast<PaidSummaryTable>();
                    history.sort((a, b) => b.date.compareTo(a.date));
                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        final item = history[index];
                        final dataItem = AppModelPaidHistoric.fromTableEntity(
                          item,
                        );
                        return _PaidHistoryCard(item: dataItem);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaidHistoryCard extends StatelessWidget {
  final AppModelPaidHistoric item;
  const _PaidHistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.receipt_long, color: Colors.black54),
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.wallet, size: 22),
            SizedBox(width: 5),
            Text(
              "TIP: \$${item.tip.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitleTextStyle: TextStyle(
          color: color.onSurfaceVariant,
          height: 1.4,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.monetization_on, size: 20),
                SizedBox(width: 5),
                Text(
                  "\$${item.ammount}",
                  style: TextStyle(fontSize: 12, color: color.onSurfaceVariant),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.people, size: 20),
                SizedBox(width: 5),
                Text(
                  "${item.qtyPeoples}",
                  style: TextStyle(fontSize: 12, color: color.onSurfaceVariant),
                ),
              ],
            ),
            Text(
              formatHumanDate(
                item.createAt.toString(),
                type: DateFormatType.dayOnly,
              ),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 10, color: color.onSurfaceVariant),
            ),
            Text(
              formatHumanDate(
                item.createAt.toString(),
                type: DateFormatType.monthOnly,
              ).toUpperCase(),
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 10, color: color.onSurfaceVariant),
            ),
          ],
        ),
        trailing: Icon(Icons.check_circle, color: Colors.green.shade300),
        onTap: () {},
      ),
    );
  }
}
