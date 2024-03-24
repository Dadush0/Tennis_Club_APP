import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_club_app/data/models/data_model.dart';
import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/data/models/lineup_model.dart';
import 'package:tennis_club_app/data/models/news_model.dart';
import 'package:tennis_club_app/data/models/team_model.dart';
import 'package:tennis_club_app/locator.dart';
import 'package:tennis_club_app/presentation/stores/news_store.dart';

class FirebaseConnection {
  static final NewsStore _newsStore = locator<NewsStore>();
  static Future<void> readLineupData() async {
    final snapshot = await FirebaseDatabase.instance.ref('lineup').get();
    final Map<String, dynamic> lineup =
        Map<String, dynamic>.from(snapshot.value as Map);
    TeamModel.deserializeTeams(lineup['teams']);
  }

  static Future<void> readNewsData() async {
    DataModel.news = [];
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> news =
        Map<String, dynamic>.from(snapshot.value as Map);
    NewsModel.deserializeNews(news['news']);
    _newsStore.getNews();
  }

  static Future<void> readEventData() async {
    DataModel.events = [];
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> events =
        Map<String, dynamic>.from(snapshot.value as Map);
    EventModel.deserializeEvents(events['events']);
  }

  static Future<bool> readPassword(String password) async {
    final snapshot = await FirebaseDatabase.instance.ref().get();
    final Map<String, dynamic> passwordData =
        Map<String, dynamic>.from(snapshot.value as Map);
    return passwordData['password'].toString() == password;
  }

  static Future<void> readPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? favouriteTeam = prefs.getString('favourite');
    if (favouriteTeam != null) DataModel.lineup.favouriteTeam = favouriteTeam;
  }

  static void writePreferences(String favouriteTeam) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourite', favouriteTeam);
  }

  static void writeNewsData() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref('news');
    await databaseReference.set(NewsModel.serializeNews());
  }

  static void writeEventsData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('events');
    await databaseReference.set(EventModel.serializeEvents());
  }

  static void writeLineupData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('lineup/teams');
    await databaseReference.set(LineupModel.serializeLineup());
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
