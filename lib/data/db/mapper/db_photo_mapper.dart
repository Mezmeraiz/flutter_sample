import 'package:flutter_sample/domain/entities/photo.dart';

extension PhotoDBMapper on Photo {

  Map<String, dynamic> toMap(String noteId) {
    return {
      'id': id,
      'image': image,
      'thumbnail': thumbnail,
      'noteId': noteId,
    };
  }

  static Photo fromMap(Map<String, dynamic> data) => Photo(
    id: data['id'] as String,
    image: data['image'] as String,
    thumbnail: data['thumbnail'] as String,
  );

}