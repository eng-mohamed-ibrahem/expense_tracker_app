import 'dart:convert';

import 'package:expense_tracker_app/core/enum/category_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class Expense with _$Expense {
  const Expense._();
  factory Expense({
    required String id,
    required double amount,
    required String description,
    required CategoryEnum category,
    required DateTime date,
    required bool isIncome,
  }) = _Expense;

  // Factory constructor to handle default value for id, isIncome and date
  factory Expense.create({
    required double amount,
    required String description,
    CategoryEnum? category,
    bool? isIncome,
    DateTime? date,
  }) {
    return Expense(
      id: Uuid().v4(),
      amount: amount,
      description: description,
      category: category ?? CategoryEnum.food,
      isIncome: isIncome ?? false,
      date: date ?? DateTime.now(),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  @override
  String toString() => jsonEncode(toJson());

  factory Expense.fromString(String string) =>
      Expense.fromJson(jsonDecode(string));
}
