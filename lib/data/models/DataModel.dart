import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/data/models/LineupModel.dart';
import 'package:tennis_club_app/data/models/NewsModel.dart';

abstract class DataModel {
  static List<NewsModel> news = [];
  static LineupModel lineup = LineupModel.empty();
  static List<EventModel> events = [];
}
