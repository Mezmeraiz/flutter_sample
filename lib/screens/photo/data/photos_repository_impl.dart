import 'package:flutter_sample/screens/photo/data/photos_api.dart';
import 'package:flutter_sample/screens/photo/data/models/photo_dto.dart';
import 'package:flutter_sample/screens/photo/data/mapper/photo_dto_mapper.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';
import 'photos_repository.dart';

class PhotosRepositoryImpl implements PhotosRepository {

  PhotosApi photosApi;

  PhotosRepositoryImpl({required this.photosApi});

  @override
  Future<List<Photo>> getPhotos(int page) async =>
      (await photosApi.getPhotos(page)).map((e) => e.toPhoto()).toList();

}