import 'package:flutter_sample/domain/entities/user.dart';

abstract class UsersInteractor {
  Future<List<User>> getUsers(int page, int results);

  Future<List<User>> getUsersByGender(String? gender);
}
