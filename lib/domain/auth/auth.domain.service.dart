import 'package:flutter/foundation.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  final AuthDomainRepository _repository;
  const AuthDomainService({@required AuthDomainRepository repository})
      : _repository = repository;
}
