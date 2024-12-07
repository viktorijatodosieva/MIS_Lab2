import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const JokeCard({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        onTap: onTap,
      ),
    );
  }
}
