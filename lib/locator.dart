import 'package:get_it/get_it.dart';
import 'package:tennis_club_app/data/datasources/firebase.dart';
import 'package:tennis_club_app/data/repositories/event_repository.dart';
import 'package:tennis_club_app/data/repositories/lineup_repository.dart';
import 'package:tennis_club_app/data/repositories/main_repository.dart';
import 'package:tennis_club_app/data/repositories/news_repository.dart';
import 'package:tennis_club_app/presentation/stores/events_store.dart';
import 'package:tennis_club_app/presentation/stores/lineup_store.dart';
import 'package:tennis_club_app/presentation/stores/main_store.dart';
import 'package:tennis_club_app/presentation/stores/news_store.dart';
import 'package:tennis_club_app/usecases/event/add_event.dart';
import 'package:tennis_club_app/usecases/game/add_game.dart';
import 'package:tennis_club_app/usecases/news/add_news.dart';
import 'package:tennis_club_app/usecases/check_password.dart';
import 'package:tennis_club_app/usecases/event/delete_event.dart';
import 'package:tennis_club_app/usecases/game/delete_game.dart';
import 'package:tennis_club_app/usecases/news/delete_news.dart';
import 'package:tennis_club_app/usecases/game/get_all_teams.dart';
import 'package:tennis_club_app/usecases/event/get_events.dart';
import 'package:tennis_club_app/usecases/game/get_favourite_team.dart';
import 'package:tennis_club_app/usecases/game/get_games_by_team.dart';
import 'package:tennis_club_app/usecases/game/get_lineup.dart';
import 'package:tennis_club_app/usecases/news/get_news.dart';
import 'package:tennis_club_app/usecases/game/set_favourite_team.dart';

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
  locator.registerLazySingleton(() => FirebaseConnection());

  // Repository
  locator.registerLazySingleton<LineupRepository>(() => LineupRepository());
  locator.registerLazySingleton<NewsRepository>(() => NewsRepository());
  locator.registerLazySingleton<EventRepository>(() => EventRepository());
  locator.registerLazySingleton<MainRepository>(() => MainRepository());
}
