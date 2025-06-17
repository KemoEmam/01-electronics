part of 'password_cubit.dart';

@immutable
sealed class PasswordState {}

final class PasswordInitial extends PasswordState {}

final class PasswordLoading extends PasswordState {}

final class PasswordSuccess extends PasswordState {}

final class PasswordFailure extends PasswordState {
  final String message;
  PasswordFailure({required this.message});
}
