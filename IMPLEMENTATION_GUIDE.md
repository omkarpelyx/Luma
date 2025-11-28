# Luma Events App - Implementation Guide

## 🎯 Overview

You now have a **fully functional Clean Architecture foundation** for the Luma Events app. The authentication system is implemented, and the structure is ready for you to add the remaining features.

## ✅ What's Already Built

### 1. Complete Authentication Feature
- **Domain Layer**: User entity, AuthRepository interface, use cases (SignInWithPhone, VerifyOtp, GetCurrentUser)
- **Data Layer**: UserModel, AuthLocalDataSource, AuthRepositoryImpl
- **Presentation Layer**: AuthBloc with events/states, SplashPage
- **Status**: ✅ Fully implemented and tested

### 2. Core Infrastructure
- **Clean Architecture** structure enforced
- **BLoC** state management configured
- **go_router** navigation setup
- **GetIt** dependency injection
- **Dark theme** with Luma colors
- **Linting rules** enforced
- **CI/CD** pipeline ready

### 3. Demo Counter Feature
- Complete example of Clean Architecture pattern
- Can be used as reference or removed
- **Status**: ✅ Fully tested (9 tests passing)

## 🔨 Next Steps: Implementing Remaining Features

### Step 1: Complete Auth UI (Priority: HIGH)

Create these pages following the existing pattern:

#### 1.1 Get Started Modal (`lib/features/auth/presentation/pages/get_started_page.dart`)
```dart
// Show modal with:
- "Continue with Phone" button
- "Continue with Email" button  
- Google sign-in button
- Apple sign-in button
```

#### 1.2 Phone Input Page (`lib/features/auth/presentation/pages/phone_input_page.dart`)
```dart
// Phone number input with:
- Country code selector
- Phone number text field
- "Continue" button
- Dispatch SignInWithPhoneRequested event
```

#### 1.3 OTP Verification Page (`lib/features/auth/presentation/pages/otp_verification_page.dart`)
```dart
// OTP input with:
- 6-digit code input
- Resend code button
- Auto-submit on complete
- Dispatch VerifyOtpRequested event
```

**Navigation Flow:**
```
SplashPage → GetStartedPage → PhoneInputPage → OtpVerificationPage → HomePage
```

### Step 2: Events Feature (Priority: HIGH)

#### 2.1 Domain Layer

**Create Event Entity** (`lib/features/events/domain/entities/event.dart`):
```dart
class Event {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String imageUrl;
  final String organizerId;
  final String organizerName;
  final String category;
  final bool isFree;
  final double? price;
  final bool requiresApproval;
  final String visibility;
}
```

**Create Repository Interface** (`lib/features/events/domain/repositories/event_repository.dart`):
```dart
abstract class EventRepository {
  Future<Either<Failure, List<Event>>> getUserEvents();
  Future<Either<Failure, List<Event>>> getNearbyEvents();
  Future<Either<Failure, List<Event>>> getEventsByCategory(String category);
  Future<Either<Failure, Event>> createEvent(Event event);
  Future<Either<Failure, Event>> getEventById(String id);
}
```

**Create Use Cases**:
- `GetUserEvents` - Fetch user's hosted/attending events
- `GetNearbyEvents` - Fetch events near user
- `CreateEvent` - Create new event
- `GetEventsByCategory` - Filter by category

#### 2.2 Data Layer

**Create EventModel** with JSON serialization
**Create EventLocalDataSource** for caching
**Create EventRemoteDataSource** for API calls (TODO: integrate backend)
**Create EventRepositoryImpl**

#### 2.3 Presentation Layer

**Create EventBloc** with events:
- `LoadUserEvents`
- `LoadNearbyEvents`
- `CreateEventRequested`
- `LoadEventsByCategory`

**Create Pages**:
- `HomePage` - Events feed with tabs
- `EventDetailsPage` - Full event details
- `CreateEventPage` - Event creation form

### Step 3: Discover Feature (Priority: MEDIUM)

#### 3.1 Create Category Entity
```dart
class Category {
  final String id;
  final String name;
  final String icon;
  final Color color;
}
```

#### 3.2 Create Calendar Entity
```dart
class Calendar {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int subscriberCount;
}
```

#### 3.3 Create DiscoverPage
- Category chips (Tech, AI, Climate, etc.)
- Featured calendars list
- Search functionality

### Step 4: Profile Feature (Priority: MEDIUM)

#### 4.1 Create ProfilePage
- User avatar and name
- Joined date
- Hosted events count
- Attended events count
- Events list (hosted/attended tabs)
- Settings button

### Step 5: Bottom Navigation (Priority: HIGH)

#### 5.1 Create MainScaffold with BottomNavigationBar
```dart
// Tabs:
- Home (events feed)
- Discover (browse)
- Create (+ button)
- Profile (user)
```

#### 5.2 Update go_router for nested navigation
```dart
// Use ShellRoute for persistent bottom nav
```

## 📝 Implementation Checklist

### Phase 1: Auth UI (1-2 days)
- [ ] Create GetStartedPage with auth options
- [ ] Create PhoneInputPage with country code
- [ ] Create OtpVerificationPage with 6-digit input
- [ ] Update router with auth flow
- [ ] Test auth flow end-to-end
- [ ] Integrate Firebase Auth (optional)

### Phase 2: Events Core (2-3 days)
- [ ] Create Event domain layer
- [ ] Create Event data layer
- [ ] Create EventBloc
- [ ] Create HomePage with events feed
- [ ] Create EventDetailsPage
- [ ] Add mock event data
- [ ] Test events feature

### Phase 3: Event Creation (1-2 days)
- [ ] Create CreateEventPage UI
- [ ] Implement image picker
- [ ] Implement date/time pickers
- [ ] Implement location picker
- [ ] Add form validation
- [ ] Connect to EventBloc
- [ ] Test event creation

### Phase 4: Discover (1 day)
- [ ] Create DiscoverPage
- [ ] Implement category filtering
- [ ] Add featured calendars
- [ ] Add search functionality

### Phase 5: Profile (1 day)
- [ ] Create ProfilePage
- [ ] Show user stats
- [ ] List hosted events
- [ ] List attended events
- [ ] Add settings

### Phase 6: Navigation (1 day)
- [ ] Create MainScaffold
- [ ] Implement bottom navigation
- [ ] Update router for nested routes
- [ ] Test navigation flow

### Phase 7: Polish (1-2 days)
- [ ] Add loading states
- [ ] Add error handling
- [ ] Add empty states
- [ ] Add animations
- [ ] Optimize performance
- [ ] Write integration tests

## 🎨 UI Components to Create

### Reusable Widgets
1. **EventCard** - Display event in list
2. **CategoryChip** - Category filter chip
3. **CalendarCard** - Featured calendar card
4. **UserAvatar** - User profile picture
5. **CustomButton** - Styled button
6. **CustomTextField** - Styled text input
7. **LoadingIndicator** - Loading spinner
8. **EmptyState** - No data placeholder
9. **ErrorView** - Error message display

## 🔌 Backend Integration

### Option 1: Firebase (Recommended for MVP)
```yaml
dependencies:
  firebase_core: ^2.24.2
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  firebase_storage: ^11.6.0
```

### Option 2: Custom Backend
- Create API client in data layer
- Implement authentication tokens
- Handle API errors
- Add retry logic

## 🧪 Testing Strategy

### Unit Tests
- Test all use cases
- Test all BLoCs
- Test repository implementations
- Test data models

### Widget Tests
- Test individual widgets
- Test page layouts
- Test user interactions

### Integration Tests
- Test complete user flows
- Test navigation
- Test state persistence

## 📚 Code Examples

### Creating a New Feature (Example: Events)

1. **Start with Domain**:
```dart
// 1. Create entity
class Event extends Equatable { ... }

// 2. Create repository interface
abstract class EventRepository { ... }

// 3. Create use cases
class GetUserEvents implements UseCase<List<Event>, NoParams> { ... }
```

2. **Implement Data Layer**:
```dart
// 1. Create model
class EventModel extends Event { ... }

// 2. Create data source
abstract class EventDataSource { ... }

// 3. Implement repository
class EventRepositoryImpl implements EventRepository { ... }
```

3. **Build Presentation**:
```dart
// 1. Create events
abstract class EventEvent extends Equatable { ... }

// 2. Create states
abstract class EventState extends Equatable { ... }

// 3. Create BLoC
class EventBloc extends Bloc<EventEvent, EventState> { ... }

// 4. Create UI
class HomePage extends StatelessWidget { ... }
```

4. **Register Dependencies**:
```dart
// In injection.dart
sl.registerFactory(() => EventBloc(...));
sl.registerLazySingleton(() => GetUserEvents(sl()));
sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl(...));
```

## 🚀 Quick Start Commands

```bash
# Install dependencies
flutter pub get

# Run app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze

# Generate coverage
flutter test --coverage

# Format code
dart format .
```

## 📖 Additional Resources

- **Clean Architecture**: See `PROJECT_STRUCTURE.md`
- **App Summary**: See `LUMA_APP_SUMMARY.md`
- **Violation Report**: See `violation_report.json`

## 💡 Tips

1. **Follow the Pattern**: Use the counter feature as a reference for structure
2. **Test as You Go**: Write tests for each use case and BLoC
3. **Keep Domain Pure**: No Flutter imports in domain layer
4. **Use BLoC Properly**: Business logic in use cases, not BLoCs
5. **Inject Everything**: Use GetIt for all dependencies
6. **Navigate with go_router**: Never use Navigator.push/pop

## 🎯 Success Criteria

- ✅ All features implemented
- ✅ All tests passing
- ✅ Zero architecture violations
- ✅ Flutter analyze shows no issues
- ✅ App runs smoothly on iOS and Android
- ✅ Dark theme consistent throughout
- ✅ Proper error handling
- ✅ Loading states implemented
- ✅ Empty states implemented

---

**You're ready to build!** Start with Phase 1 (Auth UI) and work your way through. The foundation is solid, and the pattern is clear. Good luck! 🚀
