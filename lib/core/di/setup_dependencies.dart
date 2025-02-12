import 'package:expense_tracker_app/core/services/cache_service.dart';
import 'package:expense_tracker_app/repository/expense_repo/expense_repo_impl.dart';
import 'package:expense_tracker_app/repository/expense_repo/expense_repo_interface.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Registering CacheService
  getIt.registerSingleton<CacheService>(CacheService());
  await getIt<CacheService>().init();

  // Registering ExpenseRepository
  getIt.registerSingleton<ExpenseRepository>(ExpenseRepositoryImpl());
}
