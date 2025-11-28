# Complete Project Structure

## File Tree

```
luma_event_app/
├── .github/
│   └── workflows/
│       └── ci.yml                                    # GitHub Actions CI/CD pipeline
├── lib/
│   ├── core/
│   │   ├── errors/
│   │   │   └── failures.dart                         # Base Failure classes
│   │   ├── usecases/
│   │   │   └── usecase.dart                          # Base UseCase interface
│   │   ├── utils/
│   │   │   └── network_info.dart                     # Network connectivity checker
│   │   └── constants/
│   │       └── strings.dart                          # App-wide string constants
│   ├── features/
│   │   └── counter/
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── counter.dart                  # Counter entity (pure domain)
│   │       │   ├── repositories/
│   │       │   │   └── counter_repository.dart       # Repository interface
│   │       │   └── usecases/
│   │       │       ├── get_counter.dart              # Get counter use case
│   │       │       ├── increment_counter.dart        # Increment use case
│   │       │       ├── decrement_counter.dart        # Decrement use case
│   │       │       └── reset_counter.dart            # Reset use case
│   │       ├── data/
│   │       │   ├── models/
│   │       │   │   └── counter_model.dart            # Counter model with JSON
│   │       │   ├── datasources/
│   │       │   │   └── counter_local_datasource.dart # Local storage datasource
│   │       │   └── repositories/
│   │       │       └── counter_repository_impl.dart  # Repository implementation
│   │       └── presentation/
│   │           ├── bloc/
│   │           │   ├── counter_bloc.dart             # BLoC logic
│   │           │   ├── counter_event.dart            # BLoC events
│   │           │   └── counter_state.dart            # BLoC states
│   │           ├── pages/
│   │           │   └── counter_page.dart             # Counter page widget
│   │           └── widgets/
│   │               └── counter_view.dart             # Counter display widget
│   ├── app/
│   │   ├── routes/
│   │   │   └── app_router.dart                       # go_router configuration
│   │   ├── injection.dart                            # Dependency injection setup
│   │   └── app.dart                                  # Root app widget
│   └── main.dart                                     # Application entry point
├── test/
│   └── features/
│       └── counter/
│           ├── domain/
│           │   └── usecases/
│           │       └── increment_counter_test.dart   # Use case unit tests
│           └── presentation/
│               └── bloc/
│                   └── counter_bloc_test.dart        # BLoC tests
├── analysis_options.yaml                             # Linting rules
├── pubspec.yaml                                      # Dependencies
├── violation_report.json                             # Architecture violations report
└── README.md                                         # Project documentation
```

## Layer Responsibilities

### Domain Layer (Pure Dart - No Flutter Dependencies)
- **Entities**: Business objects (Counter)
- **Repository Interfaces**: Contracts for data operations
- **Use Cases**: Single-responsibility business logic operations

### Data Layer
- **Models**: Data transfer objects with serialization
- **Data Sources**: Local/remote data access (SharedPreferences, APIs)
- **Repository Implementations**: Concrete implementations of domain interfaces

### Presentation Layer
- **BLoC**: State management (events, states, bloc)
- **Pages**: Screen-level widgets
- **Widgets**: Reusable UI components

### App Layer
- **Routes**: Navigation configuration (go_router)
- **Injection**: Dependency injection setup (GetIt)
- **App**: Root widget configuration

## Dependencies Flow

```
Presentation → Domain ← Data
     ↓           ↓        ↓
   BLoC    →  UseCases → Repository Interface
                              ↑
                         Repository Impl
                              ↑
                         DataSource
```

## Key Principles Enforced

1. **Dependency Rule**: Dependencies point inward (toward domain)
2. **Interface Segregation**: Small, focused interfaces
3. **Single Responsibility**: Each class has one reason to change
4. **Dependency Inversion**: Depend on abstractions, not concretions
5. **Immutability**: All events, states, and entities are immutable
6. **Testability**: All layers are independently testable

## Testing Strategy

- **Unit Tests**: Domain use cases (business logic)
- **BLoC Tests**: Presentation state management
- **Mock Objects**: Using mocktail for test doubles
- **Coverage**: Comprehensive test coverage for critical paths

## CI/CD Pipeline

The GitHub Actions workflow ensures:
1. Code formatting compliance
2. Static analysis passes
3. All tests pass
4. Coverage reporting

## Navigation

All navigation uses go_router:
- Type-safe routes
- Deep linking support
- Route guards (auth example provided)
- No Navigator.push/pop anywhere

## State Management

BLoC pattern with flutter_bloc:
- Events trigger state changes
- States are immutable
- Business logic in use cases, not BLoC
- Reactive UI updates

## Error Handling

Functional error handling with dartz:
- Either<Failure, Success> return types
- Explicit error handling
- Type-safe error propagation
- No exceptions in business logic
