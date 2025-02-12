import 'package:expense_tracker_app/core/di/inject.dart';
import 'package:expense_tracker_app/cubit/expense_cubit/expense_cubit.dart';
import 'package:expense_tracker_app/repository/expense_repo/expense_repo_interface.dart';
import 'package:expense_tracker_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseCubit(
        expenseRepository: inject<ExpenseRepository>(),
      ),
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => ExpenseCubit(
            expenseRepository: inject<ExpenseRepository>(),
          ),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
