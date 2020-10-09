import 'package:flutter/foundation.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  // ignore: unused_field
  final AuthDomainRepository _repository;
  const AuthDomainService({@required AuthDomainRepository repository})
      : _repository = repository;
}
