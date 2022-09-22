import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: "t1",
      title: "Novo Tenis de Corrida",
      value: 309.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Conta de Luz",
      value: 280.76,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Comunicação Indireta (Passo uma função para pegar os dados)
        TransactionForm(_addTransaction),
        // Comunicação direta (Passo os dados)
        TransactionList(_transactions),
      ],
    );
  }
}
