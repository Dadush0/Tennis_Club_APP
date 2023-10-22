import 'package:get_it/get_it.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';

final locator = GetIt.instance;

void init() {
  // Stores
  locator.registerLazySingleton(() => MainStore());

  // Use cases

  // Datasrouces

  // Repository
}
