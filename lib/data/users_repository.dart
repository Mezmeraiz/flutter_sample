import 'package:flutter_sample/data/model/users_dto.dart';
import 'package:flutter_sample/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers(int page, int results, {String? gender});
  Future<UserDTO> getError();
}
