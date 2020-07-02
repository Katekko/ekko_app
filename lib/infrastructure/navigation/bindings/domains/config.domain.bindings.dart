import 'package:arctekko/domain/config/config.domain.repository.dart';
import 'package:arctekko/domain/config/config.domain.service.dart';

class ConfigDomainBinding {
  ConfigDomainService domainService;
  ConfigDomainBinding() {
    var repository = ConfigDomainRepository();
    domainService = ConfigDomainService(repository);
  }
}
