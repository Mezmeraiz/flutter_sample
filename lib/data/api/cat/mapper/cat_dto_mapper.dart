import 'package:collection/collection.dart';
import 'package:flutter_sample/data/api/cat/dto/cat_dto.dart';
import 'package:flutter_sample/data/model/cat.dart';

extension CatDTOMapper on CatDTO {
  Cat toCat() {
    return Cat(
      id: id,
      breed: breeds.firstOrNull?.name ?? 'No breed',
      picture: url,
    );
  }
}
