import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

part 'auth.service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/auth/login')
  Future<AuthenticateUserResponse> authenticateUser(
    @Body() AuthenticateUserBody body,
  );
}
