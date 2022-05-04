import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/data/model/users_dto.dart';
import 'package:retrofit/http.dart';

part 'error_api.g.dart';

@RestApi(
  baseUrl: "https://httpstat.us/",
)
abstract class ErrorApi {
  factory ErrorApi(Dio dio, {String baseUrl}) = _ErrorApi;

  @GET("/500")
  Future<UserDTO> getError();
}
