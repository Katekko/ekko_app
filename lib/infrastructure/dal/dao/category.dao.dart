import 'package:arctekko/common/constants/table.constants.dart';
import 'package:arctekko/common/interfaces/dao.interface.dart';
import 'package:hive/hive.dart';

part 'category.dao.g.dart';

@HiveType(typeId: 1)
class CategoryDao extends BaseDao<CategoryDao> {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String desc;
}
