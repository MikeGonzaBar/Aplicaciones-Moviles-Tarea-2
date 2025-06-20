# Tip Time

A Flutter mobile application for calculating tips based on service quality and cost.

## Features

- **Service Cost Input**: Enter the cost of your service with a clean, intuitive interface
- **Service Quality Selection**: Choose from three quality levels:
  - Amazing (20% tip)
  - Good (18% tip) 
  - Okay (15% tip)
- **Round Up Option**: Toggle to round up the calculated tip amount
- **Real-time Calculation**: Instantly see the tip amount as you make selections
- **Modern UI**: Clean Material Design interface with green theme

## Screenshots

The app features a simple, user-friendly interface with:
- Input field for service cost
- Radio buttons for service quality selection
- Switch for round up functionality
- Calculate button with green styling
- Tip amount display

## Getting Started

### Prerequisites

- Flutter SDK (>=2.18.0)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd Aplicaciones-Moviles-Tarea-2
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## How to Use

1. **Enter Service Cost**: Tap the "Cost of Service" field and enter the amount
2. **Select Service Quality**: Choose one of the three quality options:
   - Amazing (20% tip rate)
   - Good (18% tip rate)
   - Okay (15% tip rate)
3. **Optional Round Up**: Toggle the "Round up tip?" switch if you want to round the tip amount
4. **Calculate**: Tap the "CALCULATE" button to see the tip amount
5. **View Result**: The calculated tip amount will appear at the bottom of the screen

## Project Structure

```
lib/
├── main.dart          # App entry point and theme configuration
└── home_page.dart     # Main UI and tip calculation logic
```

## Dependencies

- Flutter SDK
- cupertino_icons: ^1.0.2

## Development

This project was created as part of a Flutter development assignment. The app demonstrates:
- Stateful widgets and state management
- Form input handling
- Radio button groups
- Switch widgets
- Material Design components
- Basic calculations and UI updates

## License

This project is for educational purposes.
