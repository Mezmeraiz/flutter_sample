import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/data/model/users_dto.dart';
import 'package:retrofit/http.dart';

part 'users_api.g.dart';

@RestApi(
  baseUrl: "https://randomuser.me/api/",
  parser: Parser.FlutterCompute,
)
abstract class UsersApi {
  factory UsersApi(Dio dio, {String baseUrl}) = _UsersApi;

  @GET("")
  Future<UsersDTO> getUsers(
    @Query("page") int page,
    @Query("results") int results, {
    @Query("gender") String? gender,
  });

}
