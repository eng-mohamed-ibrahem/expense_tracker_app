import 'package:expense_tracker_app/models/expense/expense_model.dart';
import 'package:expense_tracker_app/repository/expense_repo/expense_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit({
    required this.expenseRepository,
  }) : super(ExpenseInitial());

  final ExpenseRepository expenseRepository;

  final List<Expense> expenses = [];

  void addExpense(Expense expense) async {
    emit(AddExpenseLoading());
    try {
      await expenseRepository.addExpense(expense);
      expenses.add(expense);
      debugPrint("expenses: $expenses");
      emit(AddExpenseSuccess(expense));
    } catch (e) {
      emit(AddExpenseFailed(e.toString()));
    }
  }

  void deleteExpense(String id) async {
    emit(DeleteExpenseLoading());
    try {
      await expenseRepository.deleteExpense(id);
      expenses.removeWhere((expense) => expense.id == id);
      emit(DeleteExpenseSuccess(id));
    } catch (e) {
      emit(DeleteExpenseFailed(e.toString()));
    }
  }

  Future<double> getTotalExpenses() async {
    return await expenseRepository.getTotalExpenses();
    // return expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
  }
}
