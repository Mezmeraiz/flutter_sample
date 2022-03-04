import 'package:flutter_sample/data/db/mapper/db_photo_mapper.dart';
import 'package:flutter_sample/domain/entities/note.dart';

extension NoteDBMapper on Note {
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'thumbnail': thumbnail,
      'gender': gender,
      'latitude': latitude,
      'longitude': longitude,
      'pictures': pictures,
    };
  }

  static Note fromMap(Map<String, dynamic> data) => Note(
        firstName: data['firstName'] as String,
        lastName: data['lastName'] as String,
        picture: data['picture'] as String,
        thumbnail: data['thumbnail'] as String,
        gender: data['gender'] as String,
        latitude: data['latitude'] as int,
        longitude: data['longitude'] as int,
        pictures: (data['pictures'] as List)
            .map((e) => PhotoDBMapper.fromMap(e))
            .toList(),
      );
}
