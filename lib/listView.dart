import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Match {
  final String date;
  final String time;
  final String homeTeam;
  final String awayTeam;
  final String field;

  Match({
    required this.date,
    required this.time,
    required this.homeTeam,
    required this.awayTeam,
    required this.field,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      date: json['Date'] as String? ?? 'Unknown',
      time: json['Time'] as String? ?? 'Unknown',
      homeTeam: json['Hometeam'] as String? ?? 'Unknown',
      awayTeam: json['Awayteam'] as String? ?? 'Unknown',
      field: json['PlayingField'] as String? ?? 'Unknown',
    );
  }
}

class MatchData {
  static Future<List<Map<String, dynamic>>> loadMatches() async {
    try {
      final jsonString = await rootBundle.loadString('assets/besta-jason.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
