import 'package:flutter/material.dart';

enum CategoryEnum {
  food("Food", Colors.red),
  transport("Transportation", Colors.blue),
  entertainment("Entertainment", Colors.purple),
  shopping("Shopping", Colors.orange),
  utilities("Utilities", Colors.green),
  health("Healthcare", Colors.teal),
  education("Education", Colors.yellow),
  others("Others", Colors.grey);

  final String name;
  final Color color;

  const CategoryEnum(this.name, this.color);
}
