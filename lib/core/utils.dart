import 'package:dio/dio.dart';

Future<T> retryHttpCall<T>(Future<T> Function() fn) async {
  var attempt = 0;
  var delay  = 200;
  while (true) {
    try {
      return await fn();
    } on DioError catch (e) {
      if (e.response.statusCode >= 500) {
        attempt++;
      } else {
        rethrow;
      }
    }
    await Future.delayed(Duration(milliseconds: delay * attempt));
  }
}
