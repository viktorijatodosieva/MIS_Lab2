import 'package:flutter/material.dart';

class RandomJokeDisplay extends StatelessWidget {
  final String setup;
  final String punchline;

  const RandomJokeDisplay({
    Key? key,
    required this.setup,
    required this.punchline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            setup,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            punchline,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
