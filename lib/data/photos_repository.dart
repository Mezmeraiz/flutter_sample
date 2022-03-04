import 'package:flutter_sample/domain/entities/photo.dart';

abstract class PhotosRepository {

  Future<List<Photo>> getPhotos(int page);

}