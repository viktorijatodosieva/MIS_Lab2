import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import '../widgets/loading_spinner.dart';
import '../widgets/error_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 5,
        title: const Text('Joke Types', style: TextStyle(fontSize: 24)),
        actions: [
          IconButton(
            icon: const Icon(Icons.casino, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/random-joke');
            },
            tooltip: 'Random Joke',
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: ApiService.fetchJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSpinner();
          } else if (snapshot.hasError) {
            return ErrorMessage(message: snapshot.error.toString());
          } else {
            final types = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/jokes', arguments: types[index]);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pink[100],
                        ),
                        child: Text(
                          types[index],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
