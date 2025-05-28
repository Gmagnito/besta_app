import 'package:flutter/material.dart';

import 'package:fobo_app/listView.dart';

class FinalGameScreen extends StatelessWidget {
  final FoMatch SelectedMatch;
  const FinalGameScreen({required this.SelectedMatch, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/Kr.png'),
            ),
            Text('Vs'),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/Valur.png'),
            ),
          ],
        ),
      ],
    );
  }
}
