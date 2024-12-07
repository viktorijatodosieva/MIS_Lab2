import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import '../widgets/loading_spinner.dart';
import '../widgets/error_message.dart';

class JokeTypeScreen extends StatelessWidget {
  final String type;

  const JokeTypeScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
        backgroundColor: Colors.pink[100],
        elevation: 5,
      ),
      body: FutureBuilder(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSpinner();
          } else if (snapshot.hasError) {
            return ErrorMessage(message: snapshot.error.toString());
          } else {
            final jokes = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: jokes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      color: Colors.pink[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          jokes[index].setup,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            jokes[index].punchline,
                            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
