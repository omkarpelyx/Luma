# Luma Events App - Clean Architecture Implementation

## 🎯 Project Overview

This is a **Luma Events** clone built with Flutter following **strict Clean Architecture** and **BLoC** state management principles. The app allows users to discover, create, and manage events.

## 📱 App Features (Based on Screenshots)

### Implemented Foundation:
1. **Authentication System**
   - Splash/Sign-in screen
   - Phone authentication with OTP
   - Email/Google/Apple sign-in options (UI ready, backend TODO)

2. **Core Architecture**
   - Clean Architecture with domain, data, and presentation layers
   - BLoC state management
   - go_router navigation
   - Dependency injection with GetIt

### Screens to Implement (UI Design Ready):
1. **Home/Events Feed** - Your events + Picked for you nearby events
2. **Discover** - Browse by category + Featured calendars
3. **Create Event** - Full event creation form
4. **Profile** - User profile with hosted/attended events

## 🏗️ Architecture Structure

```
lib/
├── core/
│   ├── errors/
│   │   └── failures.dart                    # Failure types
│   ├── usecases/
│   │   └── usecase.dart                     # Base UseCase
│   ├── utils/
│   │   └── network_info.dart                # Network utilities
│   └── constants/
│       ├── app_strings.dart                 # All app strings
│       └── app_colors.dart                  # Color scheme
├── features/
│   ├── auth/
│   │   ├── domain/
│   │   │   ├── entities/user.dart
│   │   │   ├── repositories/auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── sign_in_with_phone.dart
│   │   │       ├── verify_otp.dart
│   │   │       └── get_current_user.dart
│   │   ├── data/
│   │   │   ├── models/user_model.dart
│   │   │   ├── datasources/auth_local_datasource.dart
│   │   │   └── repositories/auth_repository_impl.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       └── pages/
│   │           └── splash_page.dart
│   └── counter/ (Demo feature - can be removed)
│       └── [Complete Clean Architecture structure]
└── app/
    ├── routes/app_router.dart               # Navigation
    ├── injection.dart                       # DI setup
    └── app.dart                             # Root widget
```

## 🎨 Design System

### Colors (Dark Theme)
- **Background**: `#000000` (Pure black)
- **Surface**: `#1A1A1A` (Dark gray)
- **Text Primary**: `#FFFFFF` (White)
- **Text Secondary**: `#9E9E9E` (Gray)
- **Accent**: `#00D9FF` (Cyan blue)

### Typography
- Clean, modern sans-serif
- High contrast for dark theme
- Clear hierarchy

## 🚀 Current Status

### ✅ Completed
- Clean Architecture foundation
- Auth feature (domain + data + presentation layers)
- BLoC state management setup
- go_router navigation
- Dependency injection
- Dark theme implementation
- Splash screen
- All linting rules passing
- Zero architecture violations

### 🔨 Next Steps to Complete Luma App

1. **Complete Auth UI**
   - Get Started modal with auth options
   - Phone number input screen
   - OTP verification screen
   - Integrate Firebase Auth or backend API

2. **Events Feature**
   - Create events domain layer (Event entity, repository, use cases)
   - Create events data layer (models, datasources, repository impl)
   - Create events presentation layer (BLoC, pages, widgets)
   - Implement event feed UI
   - Implement event details UI
   - Implement event creation form

3. **Discover Feature**
   - Category browsing
   - Featured calendars
   - Search functionality

4. **Profile Feature**
   - User profile display
   - Hosted events list
   - Attended events list
   - Settings

5. **Bottom Navigation**
   - Home, Discover, Create, Profile tabs
   - Persistent navigation state

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3      # State management
  equatable: ^2.0.5         # Value equality
  get_it: ^7.6.4            # Dependency injection
  go_router: ^12.1.3        # Navigation
  dartz: ^0.10.1            # Functional programming
  shared_preferences: ^2.2.2 # Local storage

dev_dependencies:
  mocktail: ^1.0.1          # Mocking
  bloc_test: ^9.1.5         # BLoC testing
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Analyze code
flutter analyze
```

### Test Coverage
- ✅ Auth use cases
- ✅ Auth BLoC
- ✅ Counter feature (demo)
- 🔨 TODO: Events feature tests
- 🔨 TODO: Integration tests

## 🎯 Clean Architecture Compliance

### ✅ Enforced Rules
1. **Domain layer has ZERO Flutter dependencies**
2. **Presentation depends only on domain interfaces**
3. **Data layer implements domain contracts**
4. **All navigation uses go_router (no Navigator.push/pop)**
5. **All state management through BLoC**
6. **All dependencies injected via GetIt**
7. **All events/states are immutable**
8. **Business logic in use cases, not BLoCs**

### Violation Report
```json
{
  "violations": [],
  "total": 0,
  "status": "✅ CLEAN"
}
```

## 🔐 Authentication Flow

```
Splash Screen
    ↓
Get Started Modal
    ↓
Choose Auth Method:
    ├── Phone → Enter Number → OTP → Home
    ├── Email → Enter Credentials → Home
    ├── Google → OAuth → Home
    └── Apple → OAuth → Home
```

## 📱 Navigation Structure

```
/ (splash)
    ↓
/home (events feed)
/discover (browse events)
/create (create event)
/profile (user profile)
```

## 💡 Key Implementation Notes

1. **Mock Data**: Currently using mock data for auth. Replace with Firebase Auth or your backend API.

2. **Local Storage**: User data cached in SharedPreferences. Consider using Hive or SQLite for complex data.

3. **State Persistence**: Auth state persists across app restarts.

4. **Error Handling**: Functional error handling with Either<Failure, Success> pattern.

5. **Scalability**: Architecture supports easy addition of new features following the same pattern.

## 🎓 Learning Resources

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [go_router Documentation](https://pub.dev/packages/go_router)

## 📄 License

This is a demonstration project showcasing Clean Architecture in Flutter.

---

**Status**: Foundation Complete ✅ | UI Implementation In Progress 🔨
