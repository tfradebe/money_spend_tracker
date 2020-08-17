
import 'package:flutter/material.dart';
import 'package:money_spend_tracker/models/transaction.dart';
import 'package:money_spend_tracker/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 10),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ]);
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(key: ValueKey(transactions[index].id),transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
