import 'package:expense_tracker_app/core/utils/expense_builder/expense_builder.dart';
import 'package:expense_tracker_app/core/utils/validators/validators.dart';
import 'package:expense_tracker_app/cubit/expense_cubit/expense_cubit.dart';
import 'package:expense_tracker_app/views/widgets/category_drop_down.dart';
import 'package:expense_tracker_app/views/widgets/expense_date_picker.dart';
import 'package:expense_tracker_app/views/widgets/expense_form_field.dart';
import 'package:expense_tracker_app/views/widgets/income_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  ExpenseBuilder _expenseBuilder = ExpenseBuilder();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildFormFields(),
                const SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        ExpenseFormField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validators.amount,
          icon: Icon(Icons.attach_money),
          labelText: 'Amount',
          onChanged: (amount) {
            _expenseBuilder.setAmount(double.tryParse(amount) ?? 0);
          },
        ),
        const SizedBox(height: 20),
        ExpenseFormField(
          textInputAction: TextInputAction.next,
          labelText: 'Description',
          icon: Icon(Icons.data_array_rounded),
          validator: Validators.description,
          onChanged: (description) {
            _expenseBuilder.setDescription(description);
          },
        ),
        const SizedBox(height: 20),
        CategoryDropDown(
          value: _expenseBuilder.category,
          onChanged: (category) {
            _expenseBuilder.setCategory(category!);
          },
        ),
        const SizedBox(height: 20),
        IncomeSwitch(
          value: _expenseBuilder.isIncome,
          onChanged: (value) {
            _expenseBuilder.setIncome(value);
          },
        ),
        const SizedBox(height: 20),
        ExpenseDatePicker(
          selectedDate: _expenseBuilder.date,
          onDateSelected: (date) {
            _expenseBuilder.setDate(date);
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<ExpenseCubit, ExpenseState>(
      listener: (context, state) {
        if (state is AddExpenseSuccess) {
          _showSuccessMessage();
          _resetForm();
          Navigator.pop(context);
          context.read<ExpenseCubit>().fetchAllExpenses();
        }
        if (state is AddExpenseFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton.icon(
          onPressed: _handleSubmit,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
            ),
          ),
          icon: state is AddExpenseLoading
              ? const CircularProgressIndicator()
              : const Icon(Icons.add),
          label: const Text('Add Expense'),
        );
      },
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<ExpenseCubit>().addExpense(_expenseBuilder.build());
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction added successfully')),
    );
  }

  void _resetForm() {
    setState(() {
      _formKey.currentState!.reset();
      _expenseBuilder = ExpenseBuilder();
    });
  }
}
