import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';

abstract class PhotosRepository {

  Future<List<Photo>> getPhotos(int page);

}