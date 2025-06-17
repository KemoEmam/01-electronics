import 'package:dartz/dartz.dart';
import 'package:electronics_task/core/error/failure.dart';
import 'package:electronics_task/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<void> resetPasswordWithEmail(String email);

  Future<UserEntity> saveUserData({required UserEntity user});

  Future<void> signOut();
}
