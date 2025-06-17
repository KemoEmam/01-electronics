import 'package:electronics_task/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) => UserModel(
      name: user.displayName ?? '', email: user.email ?? '', uId: user.uid);

  //to map
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }

  factory UserModel.fromEntity(UserEntity user) =>
      UserModel(name: user.name, email: user.email, uId: user.uId);
  //from json
  factory UserModel.fromMap(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], uId: json['uId']);
}
