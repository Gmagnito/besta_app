import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:fobo_app/data._sumary.dart';
import 'package:fobo_app/listView.dart';

class MatchListByTeam extends StatefulWidget {
  final String selectedTeam;
  const MatchListByTeam({super.key, required this.selectedTeam});

  @override
  State<MatchListByTeam> createState() => _MatchListByTeamState();
}

class _MatchListByTeamState extends State<MatchListByTeam> {
  List<Match> teamMatches = [];
  List<Match> homeTeamMatches = [];
  List<Match> awayTeamMatches = [];

  @override
  void initState() {
    super.initState();
    loadMatches();
  }

  Future<void> loadMatches() async {
    final String jsonString = await rootBundle.loadString(
      'assets/besta-jason.json',
    );
    print(json);

    final List<dynamic> jsonList = json.decode(jsonString);
    print(jsonList);

    List<Match> matches = jsonList.map((json) => Match.fromJson(json)).toList();

    setState(() {
      final sel = widget.selectedTeam.toLowerCase().trim();

      teamMatches =
          matches.where((m) {
            return m.homeTeam.toLowerCase().trim() == sel ||
                m.awayTeam.toLowerCase().trim() == sel;
          }).toList();

      homeTeamMatches =
          matches.where((m) {
            return m.homeTeam.toLowerCase().trim() == sel;
          }).toList();

      awayTeamMatches =
          matches.where((m) {
            return m.awayTeam.toLowerCase().trim() == sel;
          }).toList();
      print(awayTeamMatches);
      print(homeTeamMatches);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Filtered matches: ${teamMatches.length}');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Locationbutton(locationText: 'Heimaleikir', onTap: () {}),
            Locationbutton(locationText: 'Útileikir', onTap: () {}),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(242, 65, 75, 221),
              Color.fromARGB(207, 40, 27, 230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child:
            teamMatches.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  itemCount: teamMatches.length,
                  itemBuilder: (context, index) {
                    final match = teamMatches[index];
                    return ListTile(
                      title: Text(
                        '${match.homeTeam} vs ${match.awayTeam}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Text(
                        '${match.field} • ${match.date} • ${match.time}',
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color.fromARGB(255, 63, 36, 36),
                        ),
                      ),
                      onTap: () {
                        print('TextTileClicked');
                      },
                    );
                  },
                ),
      ),
    );
  }
}
