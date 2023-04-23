import 'package:flutter_sample/data/api/cat/dto/breed_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_dto.g.dart';

@JsonSerializable()
class CatDTO {
  String id;
  String url;
  List<BreedDTO> breeds;

  CatDTO({
    required this.id,
    required this.url,
    required this.breeds,
  });

  factory CatDTO.fromJson(Map<String, dynamic> json) => _$CatDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CatDTOToJson(this);
}
