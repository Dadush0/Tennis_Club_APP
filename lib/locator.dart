import 'package:get_it/get_it.dart';
import 'package:tennis_club_app/data/datasources/dataStub.dart';
import 'package:tennis_club_app/data/datasources/dataStubNews.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';
import 'package:tennis_club_app/data/repositories/NewsRepository.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';
import 'package:tennis_club_app/presentation/stores/NewsStore.dart';
import 'package:tennis_club_app/usecases/GetAllTeams.dart';
import 'package:tennis_club_app/usecases/GetFavouriteTeam.dart';
import 'package:tennis_club_app/usecases/GetGamesByTeam.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';
import 'package:tennis_club_app/usecases/GetNews.dart';
import 'package:tennis_club_app/usecases/SetFavouriteTeam.dart';

final locator = GetIt.instance;

void init() {
  // Stores
  locator.registerLazySingleton(() => MainStore());
  locator.registerLazySingleton(() => LineupStore());
  locator.registerLazySingleton(() => NewsStore());

  // Use cases
  locator.registerLazySingleton(() => GetLineup(locator()));
  locator.registerLazySingleton(() => GetGamesByTeam(locator()));
  locator.registerLazySingleton(() => GetAllTeams(locator()));
  locator.registerLazySingleton(() => SetFavouriteTeam(locator()));
  locator.registerLazySingleton(() => GetFavouriteTeam(locator()));

  locator.registerLazySingleton(() => GetNews(locator()));

  // Datasources
  locator.registerLazySingleton(() => DataStub());
  locator.registerLazySingleton(() => DataStubNews());

  // Repository
  locator.registerLazySingleton<LineupRepository>(
    () => LineupRepository(
      data: locator(),
    ),
  );
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepository(
      data: locator(),
    ),
  );
}
