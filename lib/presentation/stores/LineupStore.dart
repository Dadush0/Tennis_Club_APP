import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/widgets/GameAddWidget.dart';
import 'package:tennis_club_app/usecases/AddGame.dart';
import 'package:tennis_club_app/usecases/DeleteGame.dart';
import 'package:tennis_club_app/usecases/GetAllTeams.dart';
import 'package:tennis_club_app/usecases/GetFavouriteTeam.dart';
import 'package:tennis_club_app/usecases/GetGamesByTeam.dart';
import 'package:tennis_club_app/usecases/GetLineup.dart';
import 'package:tennis_club_app/usecases/SetFavouriteTeam.dart';

part 'LineupStore.g.dart';

// TODO: consider private or public see MainStore
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
