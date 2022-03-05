import 'package:flutter_sample/domain/entities/photo.dart';

class Note {
  final int? id;
  final String firstName;
  final String lastName;
  final String picture;
  final String thumbnail;
  final String gender;
  final double latitude;
  final double longitude;
  List<Photo> photos;

  Note({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.thumbnail,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.photos,
  });
}
