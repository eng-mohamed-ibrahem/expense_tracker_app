import 'package:expense_tracker_app/models/expense/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.transaction});
  final Expense transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(
          transaction.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: transaction.isIncome ? Colors.green : Colors.red,
        ),
        title: Text(
          transaction.category.name,
        ),
        subtitle: Text(
          DateFormat('yyyy-MM-dd').format(transaction.date),
        ),
        trailing: Text(
          transaction.isIncome
              ? '+ \$${transaction.amount.toStringAsFixed(2)}'
              : '- \$${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: transaction.isIncome ? Colors.green : Colors.red,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
