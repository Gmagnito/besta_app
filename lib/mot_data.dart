import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class Teams {
  List<String> allteams;
  Teams({required this.allteams});
}

class BestaTeams extends Teams {
  BestaTeams()
    : super(
        allteams: [
          'Afturelding',
          'Breidablik',
          'Fh',
          'Fram',
          'iA',
          'iBV',
          'Ka',
          'Kr',
          'Stjarnan',
          'Valur',
          'Vestri',
          'Vikingur',
        ],
      );
}

class FobData {
  Future<List<Map<String, dynamic>>> loadCsvData() async {
    final csvString = await rootBundle.loadString('assets/islandsmot.csv');

    final List<List<dynamic>> csvTable = CsvToListConverter().convert(
      csvString,
    );

    // Assuming the first row is the header, skip it with `skip: 1` if needed

    csvTable.map((row) {
      return {
        'date': row[0],
        'time': row[1],
        'homeTeam': row[2],
        'awayTeam': row[3],
        'playingField': row[4],
      };
    }).toList();

    return csvData;
  }
}

List<T> getUniqueItems<T>(List<T> list) {
  Set<T> seen = {};
  List<T> result = [];

  for (var item in list) {
    if (!seen.contains(item)) {
      seen.add(item);
      result.add(item);
    }
  }
  return result;
}

Future<List<String>> getUniqueHomeTeams() async {
  final fobData = FobData();
  final allMatches = await fobData.loadCsvData();

  final homeTeams =
      allMatches.map((match) => match['homeTeam'].toString()).toList();

  return getUniqueItems(homeTeams);
}

Future<List<String>> getHomeTeamsList() async {
  final fobData = FobData();
  final allMatches = await fobData.loadCsvData();

  // Extract all homeTeam values as Strings
  final homeTeams =
      allMatches.map((row) => row['homeTeam'].toString()).toList();

  // Optional: make them unique
  final uniqueHomeTeams = getUniqueItems(homeTeams);

  return uniqueHomeTeams;
}
