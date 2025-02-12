import 'package:expense_tracker_app/core/di/setup_dependencies.dart';
import 'package:expense_tracker_app/core/utils/cubit_observer/cubit_observer.dart';
import 'package:expense_tracker_app/root_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  Bloc.observer = CubitObserver();
  runApp(const RootApp());
}
