part of 'expense_cubit.dart';

abstract class ExpenseState extends Equatable {}

class ExpenseInitial extends ExpenseState {
  @override
  List<Object?> get props => [];
}

/// Add expense states
class AddExpenseLoading extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class AddExpenseSuccess extends ExpenseState {
  final Expense expense;

  AddExpenseSuccess(this.expense);

  @override
  List<Object?> get props => [expense];
}

class AddExpenseFailed extends ExpenseState {
  final String message;

  AddExpenseFailed(this.message);

  @override
  List<Object?> get props => [message];
}

/// Delete expense states
class DeleteExpenseLoading extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class DeleteExpenseSuccess extends ExpenseState {
  final String id;

  DeleteExpenseSuccess(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteExpenseFailed extends ExpenseState {
  final String message;

  DeleteExpenseFailed(this.message);

  @override
  List<Object?> get props => [message];
}

/// Fetch all expenses states
class FetchAllExpenseLoading extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class FetchAllExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;

  FetchAllExpenseLoaded(this.expenses);

  @override
  List<Object?> get props => [expenses];
}

class FetchAllExpenseFailed extends ExpenseState {
  final String message;

  FetchAllExpenseFailed(this.message);

  @override
  List<Object?> get props => [message];
}
