import 'package:expense_tracker_app/core/enum/category_enum.dart';
import 'package:expense_tracker_app/cubit/expense_cubit/expense_cubit.dart';
import 'package:expense_tracker_app/views/widgets/category_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(
                        () {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        },
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Indicator(
                  color: CategoryEnum.values[index].color,
                  text: CategoryEnum.values[index].name,
                  isSquare: true,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8,
                ),
                itemCount: CategoryEnum.values.length,
              ),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      CategoryEnum.values.length,
      (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

        return PieChartSectionData(
          color: CategoryEnum.values[i].color,
          value: filterCategories()[CategoryEnum.values[i]] ?? 0,
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: shadows,
          ),
        );
      },
    );
  }

  Map<CategoryEnum, double> filterCategories() {
    final Map<CategoryEnum, double> categories = Map.fromEntries(
      CategoryEnum.values.map((category) => MapEntry(category, 0.0)),
    );

    for (final expense in context.read<ExpenseCubit>().expenses) {
      categories[expense.category] =
          categories[expense.category]! + expense.amount;
    }

    return categories;
  }
}
