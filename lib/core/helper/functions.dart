import 'dart:convert';

import 'package:electronics_task/core/constants/constants.dart';
import 'package:electronics_task/core/services/prefs_service.dart';
import 'package:electronics_task/features/auth/data/models/user_model.dart';
import 'package:electronics_task/features/auth/domain/entities/user_entity.dart';

//func to fetch stored user data eg. name, email, uId
UserEntity getUser() {
  var jsonString = PrefsService.getString(kUserData);

  var userEntity = UserModel.fromMap(jsonDecode(jsonString));
  return userEntity;
}
