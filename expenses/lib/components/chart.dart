import 'dart:ffi';

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
        "value": 9.99,
      };
    });
  }

  const Chart(this.recenttransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr["day"].toString(),
            value: double.tryParse(tr["value"].toString())!,
            percentage: 0.0,
          );
        }).toList(),
      ),
    );
  }
}
