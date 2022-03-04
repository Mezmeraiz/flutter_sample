import 'package:json_annotation/json_annotation.dart';
part 'users_dto.g.dart';

UsersDTO deserializeUsersDTO(Map<String, dynamic> json) => UsersDTO.fromJson(json);

@JsonSerializable()
class UsersDTO {

  @JsonKey(name: "results")
  List<UserDTO> results;

  UsersDTO({required this.results});

  factory UsersDTO.fromJson(Map<String, dynamic> json) => _$UsersDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UsersDTOToJson(this);

}

@JsonSerializable()
class UserDTO {

  @JsonKey(name: "name")
  NameDTO name;

  @JsonKey(name: "picture")
  PictureDTO picture;

  @JsonKey(name: "gender")
  String gender;

  UserDTO({required this.name, required this.picture, required this.gender});

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

}

@JsonSerializable()
class NameDTO {

  @JsonKey(name: "first")
  String first;

  @JsonKey(name: "last")
  String last;

  NameDTO({required this.first, required this.last});

  factory NameDTO.fromJson(Map<String, dynamic> json) => _$NameDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NameDTOToJson(this);

}

@JsonSerializable()
class PictureDTO {

  @JsonKey(name: "large")
  String large;

  @JsonKey(name: "thumbnail")
  String thumbnail;

  PictureDTO({required this.large, required this.thumbnail});

  factory PictureDTO.fromJson(Map<String, dynamic> json) => _$PictureDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PictureDTOToJson(this);

}



