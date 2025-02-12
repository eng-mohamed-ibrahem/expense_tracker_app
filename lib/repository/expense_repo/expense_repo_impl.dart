import 'package:expense_tracker_app/core/constants/cahce_keys_constants.dart';
import 'package:expense_tracker_app/core/di/inject.dart';
import 'package:expense_tracker_app/core/services/cache_service.dart';
import 'package:expense_tracker_app/models/expense/expense_model.dart';
import 'package:expense_tracker_app/repository/expense_repo/expense_repo_interface.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  @override
  Future<void> addExpense(Expense expense) async {
    List<String> expenses = inject<CacheService>()
            .get<List<String>?>(CacheKeysConstants.expenses) ??
        [];
    expenses.add(expense.toString());
    await updateExpenses(expenses);
  }

  @override
  Future<void> deleteExpense(String id) async {
    List<Expense> expenses = await getExpenses();
    // using map is efficient than using list
    expenses.removeWhere((element) => element.id == id);
    await updateExpenses(expenses.map((e) => e.toString()).toList());
  }

  Future<void> updateExpenses(List<String> expenses) async {
    await inject<CacheService>().set(CacheKeysConstants.expenses, expenses);
  }

  @override
  Future<List<Expense>> getExpenses() async {
    List<String> expenses = inject<CacheService>()
            .get<List<String>?>(CacheKeysConstants.expenses) ??
        [];
    return expenses.map((e) => Expense.fromString(e)).toList();
  }

  @override
  Future<double> getTotalExpenses() async {
    List<Expense> expenses = await getExpenses();
    return expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
  }
}
