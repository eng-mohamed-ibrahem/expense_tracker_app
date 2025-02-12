// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      category: $enumDecode(_$CategoryEnumEnumMap, json['category']),
      date: DateTime.parse(json['date'] as String),
      isIncome: json['isIncome'] as bool,
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'category': _$CategoryEnumEnumMap[instance.category]!,
      'date': instance.date.toIso8601String(),
      'isIncome': instance.isIncome,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.food: 'food',
  CategoryEnum.transport: 'transport',
  CategoryEnum.entertainment: 'entertainment',
  CategoryEnum.shopping: 'shopping',
  CategoryEnum.utilities: 'utilities',
  CategoryEnum.health: 'health',
  CategoryEnum.education: 'education',
  CategoryEnum.others: 'others',
};
