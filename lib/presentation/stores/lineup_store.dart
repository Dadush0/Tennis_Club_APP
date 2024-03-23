import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/game_model.dart';
import 'package:tennis_club_app/data/models/player_model.dart';
import 'package:tennis_club_app/data/models/team_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/widgets/game_add_widget.dart';
import 'package:tennis_club_app/usecases/add_game.dart';
import 'package:tennis_club_app/usecases/delete_game.dart';
import 'package:tennis_club_app/usecases/get_all_teams.dart';
import 'package:tennis_club_app/usecases/get_favourite_team.dart';
import 'package:tennis_club_app/usecases/get_games_by_team.dart';
import 'package:tennis_club_app/usecases/get_lineup.dart';
import 'package:tennis_club_app/usecases/set_favourite_team.dart';

part 'lineup_store.g.dart';

// ignore: library_private_types_in_public_api
class LineupStore = _LineupStore with _$LineupStore;

abstract class _LineupStore with Store {
  final GetLineup _getLineup = locator<GetLineup>();
  final GetGamesByTeam _getGamesByTeam = locator<GetGamesByTeam>();
  final GetAllTeams _getAllTeams = locator<GetAllTeams>();
  final SetFavouriteTeam _setFavouriteTeam = locator<SetFavouriteTeam>();
  final GetFavouriteTeam _getFavouriteTeam = locator<GetFavouriteTeam>();
  final AddGame _addGame = locator<AddGame>();
  final DeleteGame _deleteGame = locator<DeleteGame>();

  String opponentName = '';
  String location = 'Home';
  List<String> playerNames = ['', '', '', ''];
  List<String> cakeNames = ['', ''];
  String manager = '';
  DateTime dateTime = DateTime.now();

  @observable
  ObservableList<TeamModel> lineup = <TeamModel>[].asObservable();
  List<String> teamNames = [];

  @observable
  Observable<bool> customTileExpanded = false.obs();

  @observable
  Observable<int> dialogIndex = DialogState.gameInfo.index.obs();

  @observable
  Observable<String> submitButton = 'Next'.obs();

  @observable
  Observable<bool> switchButton = false.obs();

  String selectedItem = '';

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

  @action
  Future<void> setFavouriteTeam(String favourite) async {
    _setFavouriteTeam.call(favourite);
  }

  @action
  Future<void> getFavouriteTeam() async {
    selectedItem = _getFavouriteTeam.call();
  }

  @action
  Future<void> changeSubmitButtonText(String text) async {
    submitButton = text.obs();
  }

  @action
  Future<void> changeSwitchButton(bool value) async {
    switchButton.value = value;
  }

  Future<void> addGame() async {
    List<PlayerModel> players =
        playerNames.map((e) => PlayerModel(displayName: e)).toList();
    List<PlayerModel> cakes = cakeNames
        .map((e) => players.firstWhere((element) => e == element.displayName))
        .toList();
    PlayerModel manager =
        players.firstWhere((element) => element.displayName == this.manager);
    GameModel game = GameModel(
        date: dateTime,
        players: players,
        location: location,
        opponentName: opponentName,
        cakes: cakes,
        manager: manager);

    String teamName = selectedItem != '' ? selectedItem : teamNames.first;
    _addGame.call(game, teamName);
    resetGameInfo();
  }

  void editGame(GameModel gameModel) {
    deleteGame(gameModel);
    addGame();
  }

  Future<void> deleteGame(GameModel gameModel) async {
    String teamName = selectedItem != '' ? selectedItem : teamNames.first;
    _deleteGame.call(gameModel, teamName);
  }

  void setGameInfo(GameModel gameModel) {
    opponentName = gameModel.opponentName;
    location = gameModel.location;
    changeSwitchButton(location == 'Away');
    playerNames = gameModel.players.map((e) => e.displayName).toList();
    cakeNames = gameModel.cakes.map((e) => e.displayName).toList();
    manager = gameModel.manager.displayName;
    dateTime = gameModel.date;
  }

  void resetGameInfo() {
    opponentName = '';
    location = 'Home';
    playerNames = ['', '', '', ''];
    cakeNames = ['', ''];
    manager = '';
    dateTime = DateTime.now();
  }
}
