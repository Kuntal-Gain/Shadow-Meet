# shadow_meet

A new Flutter project.

## project structure

```
lib/
├── core/                 # Core functionalities
│   ├── error/            # Error handling classes
│   ├── utils/            # General utilities and constants
│   ├── theme/            # App themes and styles
│   └── widgets/          # Reusable widgets
├── data/                 # Data layer
│   ├── models/           # Data models (e.g., User, Message)
│   ├── datasources/      # Remote and local data sources
│   ├── repositories/     # Repository implementations
├── domain/               # Domain layer
│   ├── entities/         # Core entities (User, Profile, etc.)
│   ├── repositories/     # Abstract repository contracts
│   ├── usecases/         # Business logic (use cases)
├── presentation/         # Presentation layer (UI + Cubit)
│   ├── cubit/            # Cubit classes and states
│   ├── screens/          # All screens
│   │   ├── auth/         # Authentication-related screens
│   │   ├── feed/         # Trivia feed screens
│   │   ├── matches/      # Matches screens
│   │   ├── chat/         # Chat screens
│   │   └── profile/      # User profile screens
└── main.dart             # App entry point

```