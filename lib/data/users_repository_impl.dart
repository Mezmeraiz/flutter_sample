import 'package:flutter_sample/data/api/error_api.dart';
import 'package:flutter_sample/data/api/mapper/user_dto_mapper.dart';
import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/data/model/users_dto.dart';
import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/domain/entities/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersApi usersApi;
  ErrorApi errorApi;

  UsersRepositoryImpl({required this.usersApi, required this.errorApi});

  @override
  Future<List<User>> getUsers(int page, int results, {String? gender}) async =>
      (await usersApi.getUsers(page, results, gender: gender))
          .results
          .map((e) => e.toUser())
          .toList();

  @override
  Future<UserDTO> getError() => errorApi.getError();
}
