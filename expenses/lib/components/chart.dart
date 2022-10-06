import '../models/transaction.dart';
import "chart_bar.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      // Essa variável pega a data atual e subtrai index dias
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var transaction in recenttransactions) {
        bool sameDay = transaction.date.day == weekDay.day;
        bool sameMonth = transaction.date.month == weekDay.month;
        bool sameYear = transaction.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transaction.value;
        }
      }

      return {
        /*
          DateFormat formata a data em uma string
          .E -> Representa o dia da semana
          [0] -> Pega a primeira letra do dia da semana
        */
        "day": DateFormat.E().format(weekDay)[0],
        "value": totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    // função fold leva como param. um valor inicial
    // e uma outra função que tem como param. um acumulador e um item
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + double.tryParse(tr["value"].toString())!;
    });
  }

  const Chart(this.recenttransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          // Separar as colunas igualmente
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr["day"].toString(),
                value: double.tryParse(tr["value"].toString())!,
                percentage: _weekTotalValue == 0
                    ? 0
                    : (tr["value"] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
