import 'package:fobo_app/data._sumary.dart';
import 'package:flutter/material.dart';
import 'package:fobo_app/mot_data.dart';

class ChoseScreen extends StatelessWidget {
  final void Function(String selectedTeam) goToGame;

  const ChoseScreen({required this.goToGame, super.key});

  @override
  Widget build(context) {
    var bestaTeams = BestaTeams();

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DAGSKRÁ BESTU DEILDARINNAR',
                style: TextStyle(fontSize: 30, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ...bestaTeams.allteams.map((team) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Teambutton(
                      answerText: team,
                      onTap: () {
                        goToGame(team);
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
