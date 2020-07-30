import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/autenticar_usuario.body.dart';
import 'dto/autenticar_usuario.response.dart';

part 'auth.service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/auth/login')
  Future<AutenticarUsuarioResponse> autenticarUsuario(
    @Body() AutenticarUsuarioBody body,
  );
}
