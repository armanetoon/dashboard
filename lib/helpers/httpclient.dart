import 'package:dio/dio.dart';

final Dio httpClient =
    Dio(BaseOptions(baseUrl: 'http://localhost:4020'));

mixin httpResponseValidator {
  validateResponse(Response<dynamic> response) {
    if (response.statusCode != 200) {
      throw ();
    }
  }
}
