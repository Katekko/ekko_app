import 'package:hive/hive.dart';
import 'package:arctekko/domain/core/interfaces/dao.interface.dart';

part 'user.dao.g.dart';

@HiveType(typeId: 0)
class UserDao with BaseDao<UserDao> {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @override
  int get tableId => id;
}
