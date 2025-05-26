import 'package:flutter/material.dart';
import 'package:fobo_app/json_data_sum.dart';

class GameScreen extends StatefulWidget {
  final String chosenTeam;

  const GameScreen({super.key, required this.chosenTeam});

  @override
  State<GameScreen> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/${widget.chosenTeam}.png', width: 50),
            Text('${widget.chosenTeam}'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 65, 75, 221),
              Color.fromARGB(255, 41, 27, 230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: MatchListByTeam(selectedTeam: widget.chosenTeam),
      ),
    );
  }
}
