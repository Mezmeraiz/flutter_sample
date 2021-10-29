import 'package:flutter_sample/screens/photo/data/photos_repository.dart';
import 'photos_interactor.dart';
import 'entities/photo.dart';

class PhotosInteractorImpl implements PhotosInteractor {

  PhotosRepository photosRepository;

  PhotosInteractorImpl({required this.photosRepository});

  @override
  Future<List<Photo>> getPhotos(int page) => photosRepository.getPhotos(page);

}