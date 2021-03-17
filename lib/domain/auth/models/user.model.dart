import 'package:ekko/domain/core/mixins/local_id.mixin.dart';
import 'package:ekko/domain/core/mixins/server_id.mixin.dart';
import 'package:ekko/infrastructure/dal/daos/user.dao.dart';
import 'package:ekko/infrastructure/dal/services/data/user.data.dart';

class UserModel with LocalId, ServerId {
  String name, email;

  UserModel({
    required this.name,
    required this.email,
    int? databaseId,
    int? serverId,
  }) {
    this.databaseId = databaseId;
    this.serverId = serverId;
  }

  factory UserModel.fromDao(UserDao dao) {
    return UserModel(
      databaseId: dao.id,
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
    var dao = UserDao(
      id: this.databaseId,
      serverId: this.serverId,
      email: this.email,
      name: this.name,
    );
    return dao;
  }
}
