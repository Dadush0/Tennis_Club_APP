import 'package:get_it/get_it.dart';
import 'package:tennis_club_app/data/datasources/dataStub.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';

final locator = GetIt.instance;

void init() {
  // Stores
  locator.registerLazySingleton(() => MainStore());
  locator.registerLazySingleton(() => LineupStore());

  // Use cases
  locator.registerLazySingleton(() => GetLineup(locator()));

  // Datasources
  locator.registerLazySingleton(() => DataStub());

  // Repository
  locator.registerLazySingleton<LineupRepository>(
    () => LineupRepository(
      data: locator(),
    ),
  );
}
