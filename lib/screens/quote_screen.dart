import 'dart:math';
import 'package:flutter/material.dart';
import '../data/quotes_data.dart';
import '../models/quote.dart';
import 'quote_detail_screen.dart';
import '../widgets/gradiant_background.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String selectedCategory = "Motivation"; // Default category
  late Quote currentQuote;

  @override
  void initState() {
    super.initState();
    currentQuote = getRandomQuote(selectedCategory);
  }

  Quote getRandomQuote(String category) {
    final filteredQuotes = quotes.where((q) => q.category == category).toList();
    return filteredQuotes[Random().nextInt(filteredQuotes.length)];
  }

  void updateQuote() {
    setState(() {
      currentQuote = getRandomQuote(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Random Quote"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            // Dropdown for category
            DropdownButton<String>(
              value: selectedCategory,
              dropdownColor: Colors.deepPurple,
              style: const TextStyle(color: Colors.white),
              items:
                  ["Motivation", "Finance", "Romance"]
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  updateQuote();
                });
              },
            ),

            // Main content: image + quote + author
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Category image
                    Image.asset(currentQuote.image, height: 200),
                    const SizedBox(height: 40),

                    // Make the quote text clickable
                    GestureDetector(
                      onTap: () {
                        // Navigate to author details on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => QuoteDetailScreen(
                                  author: currentQuote.author,
                                  authorImage: currentQuote.authorImage,
                                  birthYear: currentQuote.birthYear,
                                  deathYear: currentQuote.deathYear,
                                  authorDescription:
                                      currentQuote.authorDescription,
                                ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          // Quote text
                          Text(
                            currentQuote.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Author format: -Author - {name} -
                          Text(
                            "-Author - ${currentQuote.author} -",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom row: New Quote & View Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: updateQuote,
                  child: const Text("New Quote"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuoteDetailScreen(
                              author: currentQuote.author,
                              authorImage: currentQuote.authorImage,
                              birthYear: currentQuote.birthYear,
                              deathYear: currentQuote.deathYear,
                              authorDescription: currentQuote.authorDescription,
                            ),
                      ),
                    );
                  },
                  child: const Text("View Details"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
