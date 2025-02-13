import 'package:flutter/material.dart';

class ExpenseFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? labelText;
  final Widget? icon;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const ExpenseFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.labelText,
    this.icon,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
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
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
