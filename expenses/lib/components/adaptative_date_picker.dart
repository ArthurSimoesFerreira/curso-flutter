import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    this.selectedDate,
    required this.onDateChanged,
    super.key,
  });

  _showDatePicker(BuildContext context) {
    // Função que retorna um Future<DateTime>
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // Data mais antiga que ele pode selecionar
      firstDate: DateTime(2022), // 01/01/2022
      // Data mais próxima que ele pode selecionar
      lastDate: DateTime.now(),
      // O then só é chamado quando uma data é selecionada
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2022), // 01/01/2022
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? "Nenhuma data selecionada"
                        : "Data selecionada: ${DateFormat("dd/MM/y").format(selectedDate!)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.5),
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    "Selecionar Data",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
