import 'package:flutter_sample/data/api/mapper/user_dto_mapper.dart';
import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/domain/entities/user.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersApi usersApi;

  UsersRepositoryImpl({required this.usersApi});

  @override
  Future<List<User>> getUsers(int page, int results, {String? gender}) async =>
      (await usersApi.getUsers(page, results, gender: gender))
          .results
          .map((e) => e.toUser())
          .toList();
}
