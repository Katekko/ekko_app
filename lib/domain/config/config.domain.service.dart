import 'config.domain.repository.dart';

class ConfigDomainService {
  ConfigDomainRepository _repository;
  ConfigDomainService(this._repository);

  Future<void> loadAllConfigs() async {
    try {
      await _repository.loadCategories();
    } catch (err) {
      rethrow;
    }
  }
}
