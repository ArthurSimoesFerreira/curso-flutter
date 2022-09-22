import "package:flutter/material.dart";
import 'components/transaction_user.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Despesas Pessoais",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
        ),
        //centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.purple,
                elevation: 5,
                child: Text("Gráfico"),
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
