import 'package:expense_tracker_app/cubit/main_nav_cubit/main_nav_cubit.dart';
import 'package:expense_tracker_app/views/screens/add_expense_screen.dart';
import 'package:expense_tracker_app/views/screens/home_screen.dart';
import 'package:expense_tracker_app/views/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddExpenseScreen(),
    const ReportScreen(),
  ];

  void _onItemTapped(int index) {
    context.read<MainNavCubit>().changeNavTap(index);
    _selectedIndex = context.read<MainNavCubit>().index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavCubit, MainNavState>(
      builder: (context, state) {
        _selectedIndex = context.read<MainNavCubit>().index;

        return Scaffold(
          extendBody: true,
          body: _screens[_selectedIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: IconButton(
            style: IconButton.styleFrom(
              fixedSize: const Size(56, 56),
            ),
            icon: Icon(
              Icons.add,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            onPressed: () => _onItemTapped(1),
            tooltip: 'Add Expense',
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.list,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  tooltip: 'Expenses',
                ),
                IconButton(
                  icon: Icon(
                    Icons.bar_chart,
                    color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                  tooltip: 'Reports',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
