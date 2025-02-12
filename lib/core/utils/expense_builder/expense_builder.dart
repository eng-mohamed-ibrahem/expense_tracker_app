import 'package:expense_tracker_app/core/enum/category_enum.dart';
import 'package:expense_tracker_app/models/expense/expense_model.dart';

class ExpenseBuilder {
  double _amount = 0.0;
  String? _description;
  CategoryEnum _category = CategoryEnum.food;
  bool _isIncome = false;
  DateTime _date = DateTime.now();

  double get amount => _amount;
  String? get description => _description;
  CategoryEnum get category => _category;
  bool get isIncome => _isIncome;
  DateTime get date => _date;

  ExpenseBuilder setAmount(double amount) {
    _amount = amount;
    return this;
  }

  ExpenseBuilder setDescription(String description) {
    _description = description;
    return this;
  }

  ExpenseBuilder setCategory(CategoryEnum category) {
    _category = category;
    return this;
  }

  ExpenseBuilder setIncome(bool isIncome) {
    _isIncome = isIncome;
    return this;
  }

  ExpenseBuilder setDate(DateTime date) {
    _date = date;
    return this;
  }

  Expense build() {
    return Expense.create(
      amount: _amount,
      description: _description!,
      category: _category,
      isIncome: _isIncome,
      date: _date,
    );
  }
}
