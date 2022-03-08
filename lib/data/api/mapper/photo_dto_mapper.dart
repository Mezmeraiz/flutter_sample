import 'package:flutter_sample/data/model/photo_dto.dart';
import 'package:flutter_sample/domain/entities/photo.dart';

extension PhotoDTOMapper on PhotoDTO {
  Photo toPhoto() {
    return Photo(id: id, image: urls.regular, thumbnail: urls.thumb);
  }
}
