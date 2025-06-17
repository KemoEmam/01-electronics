import 'package:electronics_task/core/services/firebase_auth_service.dart';
import 'package:electronics_task/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:electronics_task/features/auth/domain/repos/auth_repo.dart';
import 'package:electronics_task/features/auth/presentation/manager/signup/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<Logger>(() => Logger());

  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuthService: sl<FirebaseAuthService>()));
  sl.registerFactory<SignupCubit>(() => SignupCubit(sl<AuthRepo>()));
}
