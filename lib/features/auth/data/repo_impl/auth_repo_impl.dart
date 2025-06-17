import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/error/custom_exceptions.dart';
import 'package:electronics_task/core/error/failure.dart';
import 'package:electronics_task/core/services/firebase_auth_service.dart';
import 'package:electronics_task/core/services/prefs_service.dart';
import 'package:electronics_task/core/services/service_locator.dart';
import 'package:electronics_task/features/auth/data/models/user_model.dart';
import 'package:electronics_task/features/auth/domain/entities/user_entity.dart';
import 'package:electronics_task/features/auth/domain/repos/auth_repo.dart';
import 'package:logger/logger.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
          name: name, email: email, password: password);
      final userEntity =
          UserEntity(uId: user.uid, name: name, email: user.email!);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      sl<Logger>()
          .w('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return left(ServerFailure(
          message: 'An unexpected error occurred. Please try again.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      final userEntity = UserEntity(
          uId: user.uid, name: user.displayName ?? '', email: user.email!);
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      sl<Logger>()
          .w('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return left(ServerFailure(
          message: 'An unexpected error occurred. Please try again.'));
    }
  }

  @override
  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await firebaseAuthService.resetPasswordWithEmail(email);
    } on CustomExceptions catch (e) {
      sl<Logger>().w('Exception in AuthRepoImpl.resetPassword: $e');
      rethrow;
    } catch (e) {
      sl<Logger>().w('Exception in AuthRepoImpl.resetPassword: $e');
      throw CustomExceptions(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await PrefsService.setString(kUserData, jsonData);
  }

  @override
  Future<void> signOut() async {
    return firebaseAuthService.signOut();
  }
}
