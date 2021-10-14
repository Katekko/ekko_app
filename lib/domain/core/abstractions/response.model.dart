class Response<T> {
  final int statusCode;
  final T? payload;

  bool get success => statusCode <= 200;
  
  const Response({
    required this.statusCode,
    required this.payload,
  });
}
