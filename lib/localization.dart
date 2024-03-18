import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_club_app/main.dart';

abstract class Localization {
  static String formatDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd. MMMM yyyy HH:mm");

    if (language == 'en_EN') {
      dateFormat = DateFormat("MMMM dd yyyy hh:mm");
    }

    return dateFormat.format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd. MMMM yyyy");

    if (language == 'en_EN') {
      dateFormat = DateFormat("MMMM dd yyyy");
    }

    return dateFormat.format(dateTime);
  }

  static String formatTime(TimeOfDay time) {
    DateFormat dateFormat = DateFormat("HH:mm");

    if (language == 'en_EN') {
      dateFormat = DateFormat("hh:mm");
    }
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, time.hour, time.minute);
    return dateFormat.format(dateTime);
  }
}
