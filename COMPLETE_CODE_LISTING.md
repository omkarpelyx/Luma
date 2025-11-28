# Complete Code Listing

This document contains all source code files for the Clean Architecture Flutter Counter App.

## Table of Contents
1. [Configuration Files](#configuration-files)
2. [Core Layer](#core-layer)
3. [Domain Layer](#domain-layer)
4. [Data Layer](#data-layer)
5. [Presentation Layer](#presentation-layer)
6. [App Layer](#app-layer)
7. [Tests](#tests)
8. [CI/CD](#cicd)

---

## Configuration Files

### pubspec.yaml
See: `pubspec.yaml` in project root

### analysis_options.yaml
See: `analysis_options.yaml` in project root

---

## Core Layer

### lib/core/errors/failures.dart
```dart
import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure([this.message = '']);

  final String message;

  @override
  List<Object?> get props => [message];
}

/// Failure for cache-related errors
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache failure occurred']);
}

/// Failure for server-related errors
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server failure occurred']);
}

/// Failure for network-related errors
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network failure occurred']);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failure occurred']);
}
```

### lib/core/usecases/usecase.dart
```dart
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base class for all use cases in the application
/// [T] is the return type
/// [Params] is the parameter type
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Used when a use case doesn't need parameters
class NoParams {
  const NoParams();
}
```

### lib/core/utils/network_info.dart
```dart
/// Interface for checking network connectivity
/// This is a stub implementation for demonstration purposes
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Implementation of NetworkInfo
/// In a real app, this would use connectivity_plus or similar package
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // TODO: Implement actual network checking using connectivity_plus
    return true;
  }
}
```

### lib/core/constants/strings.dart
```dart
/// Application-wide string constants
class AppStrings {
  // App
  static const String appTitle = 'Clean Architecture Counter';

  // Counter Feature
  static const String counterTitle = 'Counter';
  static const String incrementButton = 'Increment';
  static const String decrementButton = 'Decrement';
  static const String resetButton = 'Reset';

  // Errors
  static const String cacheError = 'Failed to cache data';
  static const String loadError = 'Failed to load data';
  static const String unexpectedError = 'An unexpected error occurred';
}
```

---

## Domain Layer

All domain layer files are in the project. See:
- `lib/features/counter/domain/entities/counter.dart`
- `lib/features/counter/domain/repositories/counter_repository.dart`
- `lib/features/counter/domain/usecases/get_counter.dart`
- `lib/features/counter/domain/usecases/increment_counter.dart`
- `lib/features/counter/domain/usecases/decrement_counter.dart`
- `lib/features/counter/domain/usecases/reset_counter.dart`

---

## Data Layer

All data layer files are in the project. See:
- `lib/features/counter/data/models/counter_model.dart`
- `lib/features/counter/data/datasources/counter_local_datasource.dart`
- `lib/features/counter/data/repositories/counter_repository_impl.dart`

---

## Presentation Layer

All presentation layer files are in the project. See:
- `lib/features/counter/presentation/bloc/counter_bloc.dart`
- `lib/features/counter/presentation/bloc/counter_event.dart`
- `lib/features/counter/presentation/bloc/counter_state.dart`
- `lib/features/counter/presentation/pages/counter_page.dart`
- `lib/features/counter/presentation/widgets/counter_view.dart`

---

## App Layer

All app layer files are in the project. See:
- `lib/app/app.dart`
- `lib/app/injection.dart`
- `lib/app/routes/app_router.dart`
- `lib/main.dart`

---

## Tests

All test files are in the project. See:
- `test/features/counter/domain/usecases/increment_counter_test.dart`
- `test/features/counter/presentation/bloc/counter_bloc_test.dart`

---

## CI/CD

See: `.github/workflows/ci.yml`

---

## Violation Report

See: `violation_report.json`

**Summary**: Zero violations found. All code follows Clean Architecture and BLoC principles.

---

## How to Use This Project

1. **Install dependencies**: `flutter pub get`
2. **Run the app**: `flutter run`
3. **Run tests**: `flutter test`
4. **Analyze code**: `flutter analyze`
5. **Format code**: `dart format .`

---

## Architecture Highlights

✅ **Clean Architecture**: Clear separation of domain, data, and presentation layers
✅ **BLoC Pattern**: State management with immutable events and states
✅ **go_router**: Type-safe navigation with no Navigator.push/pop
✅ **Dependency Injection**: GetIt service locator for loose coupling
✅ **Functional Error Handling**: Either<Failure, Success> pattern
✅ **Comprehensive Testing**: Unit tests and BLoC tests
✅ **Strict Linting**: Enforces best practices and immutability
✅ **CI/CD Pipeline**: Automated testing and analysis

---

## Why This Structure Works

1. **Domain Independence**: Business logic has zero framework dependencies
2. **Testability**: Each layer can be tested in isolation
3. **Maintainability**: Clear boundaries make changes predictable
4. **Scalability**: Easy to add new features following the same pattern
5. **Team Collaboration**: Clear structure helps multiple developers work together
