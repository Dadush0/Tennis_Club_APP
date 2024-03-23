import 'package:tennis_club_app/data/models/event_model.dart';
import 'package:tennis_club_app/data/models/lineup_model.dart';
import 'package:tennis_club_app/data/models/news_model.dart';

abstract class DataModel {
  static List<NewsModel> news = [];
  static LineupModel lineup = LineupModel.empty();
  static List<EventModel> events = [];
}
