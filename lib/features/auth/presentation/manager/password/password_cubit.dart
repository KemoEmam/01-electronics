import 'package:bloc/bloc.dart';
import 'package:electronics_task/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final AuthRepo authRepo;
  PasswordCubit(this.authRepo) : super(PasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(PasswordLoading());
    try {
      await authRepo.resetPasswordWithEmail(email);
      emit(PasswordSuccess());
    } catch (e) {
      emit(PasswordFailure(message: e.toString()));
    }
  }
}
