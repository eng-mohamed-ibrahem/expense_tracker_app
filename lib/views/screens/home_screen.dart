import 'package:expense_tracker_app/cubit/expense_cubit/expense_cubit.dart';
import 'package:expense_tracker_app/views/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
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
                        'No Expenses Yet.',
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
                            'Total Expenses: \$ ${NumberFormat('#,##0.00').format(snapshot.data)}',
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
                          return ExpenseCard(
                            expense: expense,
                            onDelete: () {
                              context
                                  .read<ExpenseCubit>()
                                  .deleteExpense(expense.id);
                            },
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
