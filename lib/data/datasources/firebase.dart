import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/DataModel.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

class FirebaseConnection {
  static void readDatabase() async {}

  static void readLineupData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('data/lineup');
    databaseReference.onValue.listen((event) {
      final Map<String, dynamic> lineup =
          event.snapshot.value as Map<String, dynamic>;
      deserializeTeams(lineup['teams']);
    });
  }

  static void readNewsData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('data');
    databaseReference.onValue.listen((event) {
      final Map<String, dynamic> news =
          event.snapshot.value as Map<String, dynamic>;
      deserializeNews(news['news']);
    });
  }

  static void readEventData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('data');
    databaseReference.onValue.listen((event) {
      final Map<String, dynamic> events =
          event.snapshot.value as Map<String, dynamic>;
      deserializeEvents(events['events']);
    });
  }

  static void deserializeTeams(Map<String, dynamic> teams) {
    teams.forEach((key, value) {
      TeamModel teamModel = TeamModel(teamName: value['teamName']);
      teamModel.games = deserializeGames(value['games']);
      teamModel.trainer = value['trainer'];
      DataModel.lineup.teams.add(teamModel);
    });
  }

  static List<GameModel> deserializeGames(Map<String, dynamic> games) {
    List<GameModel> gameList = [];
    games.forEach((key, value) {
      GameModel gameModel = GameModel(
          date: DateTime.parse(value['date']),
          players: [],
          location: value['location'],
          opponentName: value['opponentName'],
          cakes: [],
          manager: PlayerModel(displayName: value['manager']));
      gameModel.players = deserializePlayers(value['players']);
      gameModel.cakes = deserializeCakes(value['cakes']);
      gameList.add(gameModel);
    });
    return gameList;
  }

  static List<PlayerModel> deserializePlayers(Map<String, dynamic> players) {
    List<PlayerModel> playerList = [];
    players.forEach((key, value) {
      playerList.add(PlayerModel(displayName: value));
    });
    return playerList;
  }

  static List<PlayerModel> deserializeCakes(Map<String, dynamic> cakes) {
    List<PlayerModel> cakeList = [];
    cakes.forEach((key, value) {
      cakeList.add(PlayerModel(displayName: value));
    });
    return cakeList;
  }

  static void deserializeNews(Map<String, dynamic> news) {
    news.forEach((key, value) {
      NewsModel newsModel = NewsModel(
          title: value['title'],
          shortText: value['shortText'],
          content: value['content'],
          date: DateTime.parse(value['date']),
          preview:
              Image.asset('assets/images/tenniscamp23.png')); // ImageLoader
      newsModel.releaseDate = DateTime.parse(value['releaseDate']);
      DataModel.news.add(newsModel);
    });
  }

  static void deserializeEvents(Map<String, dynamic> events) {
    events.forEach((key, value) {
      EventModel eventModel = EventModel(
          title: value['title'],
          description: value['description'],
          location: value['location'],
          date: DateTime.parse(value['date']),
          registerDate: DateTime.parse(value['registerDate']),
          cost: value['cost'],
          maxParticipants: value['maxParticipants'],
          participants: []); //value['participants']); // List
      DataModel.events.add(eventModel);
    });
  }

  // TODO: serialize
  // update/set Data
  //
}
