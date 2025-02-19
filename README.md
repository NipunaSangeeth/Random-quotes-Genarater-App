# final_project_random_quote_genarator

A Flutter application that displays random quotes from a locally stored list. Users can select categories (Motivation, Finance, Romance), fetch new quotes, and view author details (including birth year, death year, and a short biography).

## Features

- **Category Dropdown**: Choose from Motivation, Finance, or Romance.
- **Random Quote**: Automatically fetches a random quote on startup and with each new request.
- **Author Info**: Tap the quote or press “View Details” to see author name, birth/death year, and a short description.
- **Navigation**: Uses `Navigator.push()` and `Navigator.pop()` for screen transitions.

## Screens

1. **Home Screen**  
   - Displays a welcome message and a “Next” button to navigate to the quote screen.

2. **Quote Screen**  
   - Shows the category image, quote text, and the author name (in `-Author - {name} -` format).
   - “New Quote” button to fetch another quote in the selected category.
   - “View Details” button or tapping the quote text navigates to the author details screen.

3. **Quote Detail Screen**  
   - Displays the author’s image, birth year, death year (if any), and a brief biography.
   - “Back” button to return to the quote screen.

## Project Structure

```plaintext
.
├── android/
├── ios/
├── lib/
│   ├── data/
│   │   └── quotes_data.dart        # Local quotes list
│   ├── models/
│   │   └── quote.dart             # Quote model
│   ├── screens/
│   │   ├── home_screen.dart       # Welcome screen
│   │   ├── quote_screen.dart      # Displays random quotes
│   │   └── quote_detail_screen.dart  # Shows author details
│   ├── widgets/
│   │   └── gradiant_background.dart  # Reusable gradient background widget
│   └── main.dart
├── pubspec.yaml
└── README.md
