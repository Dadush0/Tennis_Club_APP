import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/DataModel.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/models/GameModel.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';
import 'package:tennis_club_app/data/models/PlayerModel.dart';
import 'package:tennis_club_app/data/models/TeamModel.dart';

class FirebaseConnection {
  static Future<void> readLineupData() async {
    final snapshot = await FirebaseDatabase.instance.ref('lineup').get();
    final Map<String, dynamic> lineup = snapshot.value as Map<String, dynamic>;
    deserializeTeams(lineup['teams']);
  }

  static Future<void> readNewsData() async {
    DataModel.news = [];
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> news = snapshot.value as Map<String, dynamic>;
    deserializeNews(news['news']);
  }

  static Future<void> readEventData() async {
    DataModel.events = [];
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> events = snapshot.value as Map<String, dynamic>;
    deserializeEvents(events['events']);
  }

  static Future<bool> readPassword(String password) async {
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> passwordData =
        snapshot.value as Map<String, dynamic>;
    return passwordData['password'].toString() == password;
  }

  static void deserializeTeams(Map<String, dynamic> teams) {
    DataModel.lineup.teams = [];
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
    news.forEach((key, value) async {
      NewsModel newsModel = NewsModel(
          title: value['title'],
          shortText: value['shortText'],
          content: value['content'],
          date: DateTime.parse(value['date']),
          preview: value['imagePath']);
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

  static void writeNewsData() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref('news');
    await databaseReference.set(serializeNews());
  }

  static void writeEventsData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('events');
    await databaseReference.set(serializeEvents());
  }

  static void writeLineupData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('lineup/teams');
    await databaseReference.set(serializeLineup());
  }

  static Map<String, dynamic> serializeNews() {
    Map<String, dynamic> news = {};
    Map<String, dynamic> newsList = {};
    int index = 1;
    for (var element in DataModel.news) {
      news = {
        "title": element.title,
        "shortText": element.shortText,
        "content": element.content,
        "imagePath": element.preview,
        "date": element.date.toString(),
        "releaseDate": element.releaseDate.toString(),
      };
      newsList.putIfAbsent("n$index", () => news);
      index++;
    }
    return newsList;
  }

  static Map<String, dynamic> serializeEvents() {
    Map<String, dynamic> events = {};
    Map<String, dynamic> eventList = {};
    int index = 1;
    for (var element in DataModel.events) {
      events = {
        "cost": element.cost,
        "description": element.description,
        "location": element.location,
        "maxParticipants": element.maxParticipants,
        "date": element.date.toString(),
        "registerDate": element.registerDate.toString(),
        "title": element.title,
      };
      eventList.putIfAbsent("e$index", () => events);
      index++;
    }
    return eventList;
  }

  static Map<String, dynamic> serializeLineup() {
    Map<String, dynamic> team = {};
    Map<String, dynamic> teamList = {};
    int index = 1;
    for (var element in DataModel.lineup.teams) {
      team = {
        "teamName": element.teamName,
        "trainer": element.trainer,
        "games": serializeGames(element.games),
      };
      teamList.putIfAbsent("t$index", () => team);
      index++;
    }
    return teamList;
  }

  static Map<String, dynamic> serializeGames(List<GameModel> games) {
    Map<String, dynamic> game = {};
    Map<String, dynamic> gameList = {};
    int index = 1;
    for (var element in games) {
      game = {
        "date": element.date.toString(),
        "location": element.location,
        "manager": element.manager.displayName,
        "opponentName": element.opponentName,
        "cakes": serializePlayers(element.cakes),
        "players": serializePlayers(element.players),
      };
      gameList.putIfAbsent("g$index", () => game);
      index++;
    }
    return gameList;
  }

  static Map<String, dynamic> serializePlayers(List<PlayerModel> players) {
    Map<String, dynamic> playerList = {};
    int index = 1;
    for (var element in players) {
      playerList.putIfAbsent("p$index", () => element.displayName);
      index++;
    }
    return playerList;
  }

  static Future<Image> downloadImage(String imageName) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageUrl = await storageRef.child(imageName).getDownloadURL();
    return Image.network(imageUrl);
  }

  static void uploadImage(Uint8List imageBytes, String imageName) {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child(imageName);
    imageRef.putData(imageBytes);
  }
}
