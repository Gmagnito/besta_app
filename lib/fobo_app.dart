import 'package:flutter/material.dart';
import 'package:fobo_app/final_game_screen.dart';
import 'package:fobo_app/gameScreen.dart';
import 'package:fobo_app/listView.dart';
import 'package:fobo_app/start_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _FoboAppState();
}

class _FoboAppState extends State<MyApp> {
  Widget? activeScreen;
  String selectedTeam = '';

  void goToGame(String selectedTeam) {
    setState(() {
      activeScreen = GameScreen(
        chosenTeam: selectedTeam,
        onGamefinished: goToFinal,
      );
    });
  }

  void backToGameScreen() {
    setState(() {
      activeScreen = GameScreen(
        chosenTeam: selectedTeam,
        onGamefinished: goToFinal,
      );
    });
  }

  void goToFinal(FoMatch matchData) {
    setState(() {
      activeScreen = FinalGameScreen(
        SelectedMatch: matchData,
        OnBackToGameScreen: backToGame,
      );
    });
  }

  void backToGame() {
    setState(() {
      activeScreen = GameScreen(
        chosenTeam: selectedTeam,
        onGamefinished: goToFinal,
      );
    });
  }

  @override
  void initState() {
    activeScreen = ChoseScreen(goToGame: goToGame);
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
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
          child: activeScreen,
        ),
      ),
    );
  }
}
