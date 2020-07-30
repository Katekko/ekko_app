import 'package:flutter/foundation.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  AuthDomainRepository _authDomainRepository;
  AuthDomainService({@required AuthDomainRepository authDomainRepository}) {
    _authDomainRepository = authDomainRepository;
  }
}
