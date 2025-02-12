import 'package:expense_tracker_app/models/expense/expense_model.dart';

abstract class ExpenseRepository {
  Future<void> addExpense(Expense expense);
  Future<void> deleteExpense(String id);
  Future<List<Expense>> getExpenses();
  Future<double> getTotalExpenses();
}
  