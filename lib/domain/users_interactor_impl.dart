import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/users_interactor.dart';

class UsersInteractorImpl implements UsersInteractor {
  UsersRepository usersRepository;

  UsersInteractorImpl({required this.usersRepository});

  @override
  Future<List<User>> getUsers(int page, int results) =>
      usersRepository.getUsers(page, results);

  @override
  Future<List<User>> getUsersByGender(String? gender) =>
      usersRepository.getUsers(0, 50, gender: gender);
}
