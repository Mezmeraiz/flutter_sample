import 'package:flutter_sample/screens/photo/data/models/photo_dto.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';

extension PhotoDTOMapper on PhotoDTO {

  Photo toPhoto() {
    return Photo(
        id: id,
        image: urls.regular,
        thumbnail: urls.thumb
    );
  }

}