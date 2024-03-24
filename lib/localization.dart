import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_club_app/main.dart';

abstract class Localization {
  static String formatDateTime(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd. MMMM yyyy HH:mm", language);

    if (language == 'en') {
      dateFormat = DateFormat("MMMM dd, yyyy h:mm a", language);
    }

    return dateFormat.format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.yMMMMd(language);

    if (language == 'en') {
      dateFormat = DateFormat("MMMM dd, yyyy", language);
    }

    return dateFormat.format(dateTime);
  }

  static String formatTime(TimeOfDay time) {
    DateFormat dateFormat = DateFormat("HH:mm", language);

    if (language == 'en') {
      dateFormat = DateFormat("h:mm a", language);
    }
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, time.hour, time.minute);
    return dateFormat.format(dateTime);
  }
}
