import 'package:expense_tracker_app/core/enum/category_enum.dart';
import 'package:flutter/material.dart';

class CategoryDropDown extends StatelessWidget {
  final CategoryEnum value;
  final Function(CategoryEnum?) onChanged;

  const CategoryDropDown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryEnum>(
      value: value,
      decoration: const InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
        icon: Icon(Icons.category),
      ),
      onChanged: onChanged,
      items: CategoryEnum.values.map<DropdownMenuItem<CategoryEnum>>((value) {
        return DropdownMenuItem<CategoryEnum>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
