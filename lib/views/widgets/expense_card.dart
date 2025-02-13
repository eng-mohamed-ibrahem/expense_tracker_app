import 'package:expense_tracker_app/models/expense/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
    required this.onDelete,
  });
  final Expense expense;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final isIncome = expense.isIncome;
    final formattedDate = DateFormat.yMMMd().format(expense.date);

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: ListTile(
        leading: Icon(
          isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: isIncome ? Colors.green : Colors.red,
        ),
        title: Text(expense.category.name),
        subtitle: Text(formattedDate),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isIncome
                  ? '+ \$ ${NumberFormat('#,##0.00').format(expense.amount)}'
                  : '- \$ ${NumberFormat('#,##0.00').format(expense.amount)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isIncome ? Colors.green : Colors.red,
                fontSize: 16,
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.grey),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
