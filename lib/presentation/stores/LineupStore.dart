import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/usecases/GetAllTeams.dart';
import 'package:tennis_club_app/usecases/GetGamesByTeam.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';

part 'LineupStore.g.dart';

// ignore: library_private_types_in_public_api
class LineupStore = _LineupStore with _$LineupStore;

abstract class _LineupStore with Store {
  final GetLineup _getLineup = locator<GetLineup>();
  final GetGamesByTeam _getGamesByTeam = locator<GetGamesByTeam>();
  final GetAllTeams _getAllTeams = locator<GetAllTeams>();
  @observable
  ObservableList<TeamModel> lineup = <TeamModel>[].asObservable();
  List<String> teamNames = [];

  @observable
  Observable<bool> customTileExpanded = false.obs();

  @action
  Future<void> getLineup() async {
    lineup.addAll(_getLineup.call().teams);
  }

  @action
  Future<void> getGamesByTeam(String teamname) async {
    lineup.clear();
    lineup.add(_getGamesByTeam.call(teamname));
  }

  @action
  Future<void> getAllTeams() async {
    teamNames.clear();
    teamNames.addAll(_getAllTeams.call());
  }
}
