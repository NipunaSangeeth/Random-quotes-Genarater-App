/// #########
class Quote {
  final String text; // The quote text
  final String author; // The quote's author
  final String category; // e.g., "Motivation", "Finance", "Romance"
  final String image; // Image representing the quote category
  final String authorImage; // Image of the author
  final String birthYear; // Birth year of the author
  final String deathYear; // Death year (if any)
  final String authorDescription; // Short biography or description

  Quote({
    required this.text,
    required this.author,
    required this.category,
    required this.image,
    required this.authorImage,
    required this.birthYear,
    required this.deathYear,
    required this.authorDescription,
  });
}
