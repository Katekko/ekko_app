import 'package:arctekko/common/exceptions/default.exception.dart';
import 'package:arctekko/infrastructure/dal/dao/category.dao.dart';

class ConfigDomainRepository {
  Future<void> loadCategories() async {
    try {
      // TODO: Load categories from webservice
      var dao = CategoryDao()
        ..id = '0'
        ..name = 'House'
        ..desc = 'Category for house TODO\'s';
      await dao.save(id: dao.id, value: dao);
      dao = CategoryDao()
        ..id = '1'
        ..name = 'School'
        ..desc = 'Category for school TODO\'s';
      await dao.save(id: dao.id, value: dao);
      dao = CategoryDao()
        ..id = '2'
        ..name = 'Nothing'
        ..desc = 'Category for nothing TODO\'s';
      await dao.save(id: dao.id, value: dao);
      dao = CategoryDao()
        ..id = '3'
        ..name = 'Lazy'
        ..desc = 'Category for lazy TODO\'s';
      await dao.save(id: dao.id, value: dao);
      dao = CategoryDao()
        ..id = '4'
        ..name = 'Sexy'
        ..desc = 'Category for sexy TODO\'s';
      await dao.save(id: dao.id, value: dao);
      dao = CategoryDao()
        ..id = '5'
        ..name = 'Funny'
        ..desc = 'Category for funny TODO\'s';
      await dao.save(id: dao.id, value: dao);
    } catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }
}
