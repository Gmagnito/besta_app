import 'package:flutter/material.dart';

class Teambutton extends StatelessWidget {
  const Teambutton({required this.answerText, required this.onTap, super.key});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: const Color.fromARGB(255, 143, 145, 243),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        shadowColor: const Color.fromARGB(255, 39, 15, 104),
        fixedSize: Size(200, 200),
      ),
      child: Image.asset(
        'assets/$answerText.png',
        height: 180,
        width: 180,
        fit: BoxFit.contain,
      ),
    );
  }
}

class Locationbutton extends StatelessWidget {
  const Locationbutton({
    required this.locationText,
    required this.onTap,
    super.key,
  });
  final String locationText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 143, 145, 243),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        shadowColor: const Color.fromARGB(255, 86, 52, 179),
      ),
      child: Text(
        '$locationText',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
