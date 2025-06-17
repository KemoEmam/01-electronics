import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/services/prefs_service.dart';
import 'package:electronics_task/features/auth/domain/entities/user_entity.dart';
import 'package:electronics_task/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> getUserData() async {
    final username = PrefsService.getString(kUserData);
    if (username != null) {
      final user = UserModel.fromMap(jsonDecode(username));
      emit(SigninSuccess(userEntity: user));
    }
  }

  Future<void> signOut() async {
    await authRepo.signOut();
    await PrefsService.setString(kUserData, '');

    emit(SigninInitial());
  }
}
