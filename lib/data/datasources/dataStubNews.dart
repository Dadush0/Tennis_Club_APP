import 'package:tennis_club_app/data/models/NewsModel.dart';

class DataStubNews {
  late List<NewsModel> newsModel;
  DataStubNews() {
    newsModel = <NewsModel>[
      NewsModel(
          title: 'Tenniscamp 2023',
          shortText: 'Sportlicher Start in die Sommerferien',
          content:
              'Traditionell in der ersten Woche der Sommerferien fand auch in '
              'diesem Jahr das Tenniscamp des TB/ASV Regenstauf im Rahmen des '
              'Regenstaufer Ferienprogramms statt. Zehn engagierte Trainer '
              'zeigten den 45 Nachwuchsspielern im Alter von 4 bis 15 Jahren '
              'Anfang August nicht nur Tricks und Kniffe mit Ball und Schläger.'
              ' Geschicklichkeitsübungen und Konditionstraining standen '
              'ebenfalls auf dem Programm. Aber auch der Spaß kam nicht zu '
              'kurz. Ein Abschlussturnier und das gemeinsame Pizzaessen, eine '
              'feste Institution zum Ende des Tenniscamps, ließen die vier '
              'sportlichen Tage ausklingen.',
          preview: 'assets/images/tenniscamp23.png',
          date: DateTime(2023, 7, 28))
    ];
  }

  List<NewsModel> getNews() {
    return newsModel;
  }
}
