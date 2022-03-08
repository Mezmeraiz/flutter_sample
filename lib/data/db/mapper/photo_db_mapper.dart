import 'package:flutter_sample/domain/entities/photo.dart';

extension PhotoDBMapper on Photo {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'thumbnail': thumbnail,
    };
  }

  static Photo fromMap(Map<String, dynamic> data) => Photo(
        id: data['id'] as String,
        image: data['image'] as String,
        thumbnail: data['thumbnail'] as String,
      );
}
