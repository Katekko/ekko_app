import 'package:arctekko/infrastructure/dal/daos/user.dao.dart';
import 'package:arctekko/infrastructure/dal/services/data/user.data.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  int id;
  String name, email;
  UserModel({@required this.id, @required this.name, @required this.email});

  factory UserModel.fromDao(UserDao dao) {
    return UserModel(id: dao.id, name: dao.name, email: dao.email);
  }

  factory UserModel.fromData(UserData data) {
    return UserModel(id: data.id, name: data.name, email: data.email);
  }

  Future<void> save() async {
    var dao = toDao();
    await dao.save();
  }

  UserDao toDao() {
    var dao = UserDao(id: this.id, email: this.email, name: this.name);
    return dao;
  }
}
