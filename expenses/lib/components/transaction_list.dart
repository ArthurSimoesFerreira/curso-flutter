import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "Nenhuma Transação Cadastrada",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets\\images\\waiting.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          "R\$${tr.value}",
                          style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat("d MMM y").format(tr.date),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: (() => onRemove(tr.id)),
                  ),
                ),
              );
            },
          );
  }
}
