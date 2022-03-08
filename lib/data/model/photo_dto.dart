import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDTO {
  String id;

  Urls urls;

  PhotoDTO({required this.id, required this.urls});

  factory PhotoDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDTOToJson(this);
}

@JsonSerializable()
class Urls {
  String regular;

  String thumb;

  Urls({required this.regular, required this.thumb});

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
