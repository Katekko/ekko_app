import 'package:arctekko/domain/todo/todo.domain.repository.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';

class TodoDomainBinding {
  TodoDomainService domainService;
  TodoDomainBinding() {
    var repository = TodoDomainRepository();
    domainService = TodoDomainService(repository);
  }
}
