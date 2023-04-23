import 'package:flutter_sample/data/storage/storage.dart';

abstract class AuthRepository {
  Future<void> login();

  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  Storage storage;

  AuthRepositoryImpl({required this.storage});

  @override
  Future<void> login() => storage.saveToken(token: 'token');

  @override
  Future<void> logout() => storage.clearToken();
}
