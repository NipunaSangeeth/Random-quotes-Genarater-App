import 'package:flutter/material.dart';
import '../widgets/gradiant_background.dart';

class QuoteDetailScreen extends StatelessWidget {
  final String author;
  final String authorImage;
  final String birthYear;
  final String deathYear;
  final String authorDescription;

  const QuoteDetailScreen({
    super.key,
    required this.author,
    required this.authorImage,
    required this.birthYear,
    required this.deathYear,
    required this.authorDescription,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Author Details"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(authorImage, height: 150),
              const SizedBox(height: 20),
              Text(
                "Author: $author",
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "Born: $birthYear",
                style: const TextStyle(fontSize: 18, color: Colors.white70),
              ),
              if (deathYear.isNotEmpty)
                Text(
                  "Died: $deathYear",
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
              const SizedBox(height: 10),
              Text(
                authorDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
