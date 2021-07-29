import 'package:brew_coffee/services/auth.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:get_it/get_it.dart' as getIt;

final locator = getIt.GetIt.instance;

void setupLocator() async {
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<DatabaseService>(DatabaseService());
}