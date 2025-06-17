//add packages firebase_auth & google_sign_in & logger & flutter_facebook_auth
import 'package:electronics_task/core/error/custom_exceptions.dart';
import 'package:electronics_task/core/services/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final logger = sl<Logger>();

  Future<User> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
      final updatedUser = _firebaseAuth.currentUser;

      return updatedUser!;
    } on FirebaseAuthException catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e and code is:${e.code}');
      throw _mapFirebaseAuthException(e, AuthAction.signup);
    } catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e');
      throw CustomExceptions(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.signInWithEmailAndPassword: $e and code is:${e.code}');
      throw _mapFirebaseAuthException(e, AuthAction.signin);
    } catch (e) {
      logger
          .w('Exception in FirebaseAuthService.signInWithEmailAndPassword: $e');
      throw CustomExceptions(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      logger.w('Exception in FirebaseAuthService.resetPasswordWithEmail: $e');
      throw _mapFirebaseAuthException(e, AuthAction.resetPassword);
    } catch (e) {
      logger.w('Exception in FirebaseAuthService.resetPasswordWithEmail: $e');
      throw CustomExceptions(
          message: 'An unexpected error occurred. Please try again.');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      throw CustomExceptions(
        message: 'An error occurred while signing out.',
      );
    } catch (e) {
      logger.w('Exception in FirebaseAuthService.signOut: $e');
      throw CustomExceptions(
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  CustomExceptions _mapFirebaseAuthException(
      FirebaseAuthException e, AuthAction action) {
    switch (action) {
      case AuthAction.signup:
        return _handleSignupErrors(e);
      case AuthAction.signin:
        return _handleSigninErrors(e);
      case AuthAction.resetPassword:
        return _handleResetPasswordErrors(e);
      case AuthAction.signout:
        return CustomExceptions(
            message: "An error occurred while signing out.");
    }
  }

  CustomExceptions _handleSignupErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomExceptions(
          message: 'The password provided is too weak.',
        );
      case 'email-already-in-use':
        return CustomExceptions(
          message: 'The account already exists for that email.',
        );
      case 'invalid-email':
        return CustomExceptions(
          message: 'The email address provided is invalid.',
        );
      case 'network-request-failed':
        return CustomExceptions(
          message: 'Network request failed. Check your internet connection.',
        );
      default:
        return CustomExceptions(
          message: 'Error creating the account. Try again.',
        );
    }
  }

  CustomExceptions _handleSigninErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return CustomExceptions(
          message: 'No user found for that email.',
        );
      case 'wrong-password':
        return CustomExceptions(
          message: 'The email or password provided is incorrect.',
        );
      case 'invalid-email':
        return CustomExceptions(
          message: 'The email address provided is invalid.',
        );
      case 'invalid-credential':
        return CustomExceptions(
          message: 'The email or password provided is incorrect.',
        );
      case 'too-many-requests':
        return CustomExceptions(
          message: 'Too many login attempts. Try again later.',
        );
      case 'network-request-failed':
        return CustomExceptions(
          message: 'Network request failed. Check your internet connection.',
        );
      default:
        return CustomExceptions(
          message: 'Error signing in. Try again.',
        );
    }
  }
}

CustomExceptions _handleResetPasswordErrors(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return CustomExceptions(
          message: "The email address provided is invalid.");
    case 'user-not-found':
      return CustomExceptions(
          message:
              "The email provided does not exist in our records. Please check your email and try again.");
    case 'network-request-failed':
      return CustomExceptions(
          message: "Network request failed. Check your internet connection.");
    default:
      return CustomExceptions(
          message:
              "There was an error changing the password. Try again later.");
  }
}

enum AuthAction { signup, signin, signout, resetPassword }
