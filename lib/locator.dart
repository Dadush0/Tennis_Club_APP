import 'package:get_it/get_it.dart';
import 'package:tennis_club_app/data/datasources/dataStub.dart';
import 'package:tennis_club_app/data/datasources/dataStubEvents.dart';
import 'package:tennis_club_app/data/datasources/dataStubNews.dart';
import 'package:tennis_club_app/data/repositories/EventRepository.dart';
import 'package:tennis_club_app/data/repositories/LineupRepository.dart';
import 'package:tennis_club_app/data/repositories/MainRepository.dart';
import 'package:tennis_club_app/data/repositories/NewsRepository.dart';
import 'package:tennis_club_app/presentation/stores/EventStore.dart';
import 'package:tennis_club_app/presentation/stores/LineupStore.dart';
import 'package:tennis_club_app/presentation/stores/MainStore.dart';
import 'package:tennis_club_app/presentation/stores/NewsStore.dart';
import 'package:tennis_club_app/usecases/AddEvent.dart';
import 'package:tennis_club_app/usecases/AddGame.dart';
import 'package:tennis_club_app/usecases/AddNews.dart';
import 'package:tennis_club_app/usecases/CheckPassword.dart';
import 'package:tennis_club_app/usecases/DeleteEvent.dart';
import 'package:tennis_club_app/usecases/DeleteGame.dart';
import 'package:tennis_club_app/usecases/DeleteNews.dart';
import 'package:tennis_club_app/usecases/GetAllTeams.dart';
import 'package:tennis_club_app/usecases/GetEvents.dart';
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
  locator.registerLazySingleton(() => EventStore());

  // Use cases
  locator.registerLazySingleton(() => GetLineup(locator()));
  locator.registerLazySingleton(() => GetGamesByTeam(locator()));
  locator.registerLazySingleton(() => GetAllTeams(locator()));
  locator.registerLazySingleton(() => SetFavouriteTeam(locator()));
  locator.registerLazySingleton(() => GetFavouriteTeam(locator()));
  locator.registerLazySingleton(() => AddGame(locator()));
  locator.registerLazySingleton(() => DeleteGame(locator()));

  locator.registerLazySingleton(() => GetNews(locator()));
  locator.registerLazySingleton(() => AddNews(locator()));
  locator.registerLazySingleton(() => DeleteNews(locator()));

  locator.registerLazySingleton(() => GetEvents(locator()));
  locator.registerLazySingleton(() => AddEvent(locator()));
  locator.registerLazySingleton(() => DeleteEvent(locator()));

  locator.registerLazySingleton(() => CheckPassword(locator()));

  // Datasources
  locator.registerLazySingleton(() => DataStub());
  locator.registerLazySingleton(() => DataStubNews());
  locator.registerLazySingleton(() => DataStubEvents());

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

  locator.registerLazySingleton<EventRepository>(
    () => EventRepository(
      data: locator(),
    ),
  );

  locator.registerLazySingleton<MainRepository>(
    () => MainRepository(
      data: locator(),
    ),
  );
}
