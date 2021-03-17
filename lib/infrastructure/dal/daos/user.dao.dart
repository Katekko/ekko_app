import 'package:ekko/domain/core/mixins/dao.mixin.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserDao with BaseDao<UserDao> {
  int? id;
  int? serverId;
  String name;
  String email;

  UserDao({
    required this.name,
    required this.email,
    this.id,
    this.serverId,
  });

  @override
  int? get tableId => id;
}
