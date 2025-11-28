# Luma Events App - Clean Architecture

A Flutter event management application built with Clean Architecture, BLoC state management, and modern Flutter best practices. This is a clone of the Luma events platform.

## 🎯 Features

### Implemented
- ✅ Authentication system (Phone, Email, Google, Apple)
- ✅ Splash screen with Luma branding
- ✅ Clean Architecture foundation
- ✅ Dark theme UI
- ✅ State management with BLoC
- ✅ Type-safe navigation with go_router

### In Progress
- 🔨 Events feed (Home screen)
- 🔨 Discover page with categories
- 🔨 Event creation form
- 🔨 User profile
- 🔨 Bottom navigation

## Architecture Overview

This project strictly follows Clean Architecture with clear separation of concerns:

```
lib/
├── core/                    # Shared utilities and base classes
│   ├── errors/             # Failure classes
│   ├── usecases/           # Base UseCase interface
│   ├── utils/              # Utilities (NetworkInfo, etc.)
│   └── constants/          # App-wide constants
├── features/               # Feature modules
│   └── counter/
│       ├── domain/         # Business logic layer (pure Dart)
│       │   ├── entities/   # Business objects
│       │   ├── repositories/  # Repository interfaces
│       │   └── usecases/   # Business use cases
│       ├── data/           # Data layer
│       │   ├── models/     # Data models with serialization
│       │   ├── datasources/  # Data sources (local/remote)
│       │   └── repositories/  # Repository implementations
│       └── presentation/   # UI layer
│           ├── bloc/       # BLoC state management
│           ├── pages/      # Page widgets
│           └── widgets/    # Reusable widgets
└── app/                    # Application layer
    ├── routes/             # go_router configuration
    ├── injection.dart      # Dependency injection setup
    └── app.dart            # Root app widget
```

## Getting Started

### Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart SDK 3.10.1 or higher

### Installation

1. Clone the repository
2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Running Tests

Run all tests:
```bash
flutter test
```

Run tests with coverage:
```bash
flutter test --coverage
```

## Code Quality

### Analyze code:
```bash
flutter analyze
```

### Format code:
```bash
dart format .
```

### Check formatting:
```bash
dart format --set-exit-if-changed .
```

## CI/CD

The project includes a GitHub Actions workflow (`.github/workflows/ci.yml`) that:
- Runs `flutter analyze` to check for code issues
- Runs `flutter test` to execute all tests
- Runs `dart format --set-exit-if-changed` to enforce code formatting

## Why This Structure Enforces Clean Architecture & BLoC Principles

1. **Layer Independence**: The domain layer has zero dependencies on Flutter or external frameworks. It contains only pure Dart business logic (entities, repository interfaces, use cases). This makes business logic testable and framework-agnostic.

2. **Dependency Inversion**: The presentation layer depends on domain abstractions (repository interfaces, use cases) rather than concrete implementations. The data layer implements these interfaces. Dependencies flow inward toward the domain.

3. **Single Responsibility**: Each layer has a clear purpose:
   - Domain: Business rules and entities
   - Data: Data fetching, caching, and transformation
   - Presentation: UI and user interaction
   - BLoC: Presentation state management (no business logic)

4. **BLoC Pattern Enforcement**: BLoCs only call use cases (not repositories directly), ensuring business logic stays in the domain layer. Events and states are immutable, preventing unintended mutations. All state changes flow through the BLoC.

5. **Dependency Injection**: GetIt service locator ensures no direct instantiation in presentation code. All dependencies are injected, making the code testable and loosely coupled. Blocs are registered as factories, repositories as lazy singletons.

## Key Technologies

- **State Management**: flutter_bloc
- **Navigation**: go_router
- **Dependency Injection**: get_it
- **Functional Programming**: dartz (Either type for error handling)
- **Testing**: mocktail, bloc_test
- **Local Storage**: shared_preferences

## Project Status

✅ Clean Architecture implemented
✅ BLoC state management
✅ go_router navigation
✅ Dependency injection with GetIt
✅ Unit tests for use cases
✅ BLoC tests with bloc_test
✅ Strict linting rules
✅ CI/CD pipeline
✅ Zero architecture violations

## License

This project is a demonstration of Clean Architecture principles in Flutter.
