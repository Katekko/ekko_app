import 'package:arctekko/infrastructure/dal/daos/user.dao.dart';
import 'package:arctekko/infrastructure/dal/services/data/user.data.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  /// ID from local database
  int id;

  String name, email;
  int serverId;

  UserModel({
    this.id,
    @required this.name,
    @required this.email,
    @required this.serverId,
  });

  factory UserModel.fromDao(UserDao dao) {
    return UserModel(
      id: dao.id,
      serverId: dao.serverId,
      name: dao.name,
      email: dao.email,
    );
  }

  factory UserModel.fromData(UserData data) {
    return UserModel(
      name: data.name,
      email: data.email,
      serverId: data.id,
    );
  }

  void save() {
    var dao = toDao();
    dao.save(dao);
  }

  UserDao toDao() {
    var dao = UserDao(id: this.id, email: this.email, name: this.name);
    return dao;
  }
}
