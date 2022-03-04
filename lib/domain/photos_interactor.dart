import 'package:flutter_sample/domain/entities/photo.dart';

abstract class PhotosInteractor {

  Future<List<Photo>> getPhotos(int page);

}