import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                tr.value.toStringAsFixed(2),
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
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: Text("Excluir",
                    style: TextStyle(color: Theme.of(context).errorColor)),
                onPressed: (() => onRemove(tr.id)),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: (() => onRemove(tr.id)),
              ),
      ),
    );
  }
}
