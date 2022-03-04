import 'package:flutter_sample/domain/entities/photo.dart';

class Note {
  final String firstName;
  final String lastName;
  final String picture;
  final String thumbnail;
  final String gender;
  final int latitude;
  final int longitude;
  List<Photo> pictures;

  Note({
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.thumbnail,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.pictures,
  });
}
