import 'package:flutter/material.dart';

class IncomeSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const IncomeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<IncomeSwitch> createState() => _IncomeSwitchState();
}

class _IncomeSwitchState extends State<IncomeSwitch> {
  bool income = false;

  @override
  void initState() {
    super.initState();
    income = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            income = !income;
            widget.onChanged(income);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Icon(
                income ? Icons.arrow_upward : Icons.arrow_downward,
                color: income ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 12),
              Text(
                income ? 'Income' : 'Expense',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              AbsorbPointer(
                child: Switch(
                  value: income,
                  onChanged: (bool value) {},
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
