import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/random_joke_display.dart';
import '../widgets/loading_spinner.dart';
import '../widgets/error_message.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
        backgroundColor: Colors.pink[100],
        elevation: 5,
      ),
      body: FutureBuilder(
        future: ApiService.fetchRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSpinner();
          } else if (snapshot.hasError) {
            return ErrorMessage(message: snapshot.error.toString());
          } else {
            final joke = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          joke.setup,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          joke.punchline,
                          style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.pink),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
