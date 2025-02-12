import 'package:flutter/material.dart';

class ExpenseFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? labelText;
  final Widget? icon;
  final String? initialValue;

  const ExpenseFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.labelText,
    this.icon,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        icon: icon,
      ),
      keyboardType: TextInputType.number,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
