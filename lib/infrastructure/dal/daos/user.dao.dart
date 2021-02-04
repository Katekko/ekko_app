import 'package:arctekko/domain/core/mixins/dao.interface.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserDao with BaseDao<UserDao> {
  int id, serverId;
  String name;
  String email;

  UserDao({this.id, this.name, this.email, this.serverId});

  @override
  int get tableId => id;
}
