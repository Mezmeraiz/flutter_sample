import 'package:flutter_sample/data/model/users_dto.dart';
import 'package:flutter_sample/domain/entities/user.dart';

extension UserDTOMapper on UserDTO {
  User toUser() {
    return User(
        firstName: name.first,
        lastName: name.last,
        picture: picture.large,
        thumbnail: picture.thumbnail,
        gender: gender);
  }
}
