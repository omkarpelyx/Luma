import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/utils/network_info.dart';
import '../features/auth/data/datasources/auth_local_datasource.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/get_current_user.dart';
import '../features/auth/domain/usecases/sign_in_with_phone.dart';
import '../features/auth/domain/usecases/verify_otp.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/counter/data/datasources/counter_local_datasource.dart';
import '../features/counter/data/repositories/counter_repository_impl.dart';
import '../features/counter/domain/repositories/counter_repository.dart';
import '../features/counter/domain/usecases/decrement_counter.dart';
import '../features/counter/domain/usecases/get_counter.dart';
import '../features/counter/domain/usecases/increment_counter.dart';
import '../features/counter/domain/usecases/reset_counter.dart';
import '../features/counter/presentation/bloc/counter_bloc.dart';
import '../features/events/data/datasources/event_dummy_datasource.dart';
import '../features/events/data/repositories/event_repository_impl.dart';
import '../features/events/domain/repositories/event_repository.dart';
import '../features/events/domain/usecases/get_nearby_events.dart';
import '../features/events/domain/usecases/get_user_events.dart';
import '../features/events/presentation/bloc/events_bloc.dart';

final sl = GetIt.instance;


Future<void> initializeDependencies() async {

  
  sl.registerFactory(
    () => AuthBloc(
      getCurrentUser: sl(),
      signInWithPhone: sl(),
      verifyOtp: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithPhone(sl()));
  sl.registerLazySingleton(() => VerifyOtp(sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  
  sl.registerFactory(
    () => EventsBloc(
      getUserEvents: sl(),
      getNearbyEvents: sl(),
    ),
  );

  
  sl.registerLazySingleton(() => GetUserEvents(sl()));
  sl.registerLazySingleton(() => GetNearbyEvents(sl()));

  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      dummyDataSource: sl(),
    ),
  );

  sl.registerLazySingleton(() => EventDummyDataSource());


  sl.registerFactory(
    () => CounterBloc(
      getCounter: sl(),
      incrementCounter: sl(),
      decrementCounter: sl(),
      resetCounter: sl(),
    ),
  );

  
  sl.registerLazySingleton(() => GetCounter(sl()));
  sl.registerLazySingleton(() => IncrementCounter(sl()));
  sl.registerLazySingleton(() => DecrementCounter(sl()));
  sl.registerLazySingleton(() => ResetCounter(sl()));

  sl.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  
  sl.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(sl()),
  );



  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
