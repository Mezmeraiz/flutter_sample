import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';

abstract class PhotosInteractor {

  Future<List<Photo>> getPhotos(int page);

}