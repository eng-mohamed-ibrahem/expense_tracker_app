part of 'expense_cubit.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

/// Add expense states
class AddExpenseLoading extends ExpenseState {}

class AddExpenseSuccess extends ExpenseState {
  final Expense expense;

  AddExpenseSuccess(this.expense);
}

class AddExpenseFailed extends ExpenseState {
  final String message;

  AddExpenseFailed(this.message);
}

/// Delete expense states
class DeleteExpenseLoading extends ExpenseState {}

class DeleteExpenseSuccess extends ExpenseState {
  final String id;

  DeleteExpenseSuccess(this.id);
}

class DeleteExpenseFailed extends ExpenseState {
  final String message;

  DeleteExpenseFailed(this.message);
}

/// Fetch all expenses states
class FetchAllExpenseLoading extends ExpenseState {}

class FetchAllExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;

  FetchAllExpenseLoaded(this.expenses);
}

class FetchAllExpenseFailed extends ExpenseState {
  final String message;

  FetchAllExpenseFailed(this.message);
}
