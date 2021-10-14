import './response.model.dart';

abstract class IHttpConnect {
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
  });

  Future<Response<T>> post<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
  });

  Future<Response<T>> put<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
  });

  Future<Response<T>> patch<T>(
    String url,
    Map<String, dynamic> body, {
    T Function(dynamic)? decoder,
  });

  Future<Response<T>> delete<T>(
    String url, {
    required T Function(dynamic)? decoder,
  });
}
