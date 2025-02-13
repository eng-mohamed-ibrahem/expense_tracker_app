import 'package:expense_tracker_app/cubit/expense_cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is FetchAllExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchAllExpenseFailed) {
            return const Center(child: Text('Failed to load expenses'));
          }
          var expenses = context.watch<ExpenseCubit>().expenses;
          debugPrint("expenses: $expenses, ${expenses.isEmpty}");
          return expenses.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.money_off,
                        size: 80,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No transactions yet.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FutureBuilder<double>(
                        future:
                            context.watch<ExpenseCubit>().getTotalExpenses(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return Text(
                            'Total Expenses: \$${snapshot.data!.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final expense = expenses[index];
                          return ListTile(
                            title: Text(expense.description),
                            subtitle: Text(
                                '${expense.category} - \$${expense.amount.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => context
                                  .read<ExpenseCubit>()
                                  .deleteExpense(expense.id),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
