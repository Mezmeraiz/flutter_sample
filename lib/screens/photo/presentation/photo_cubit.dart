import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';
import 'package:flutter_sample/screens/photo/domain/photos_interactor.dart';

import 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {

  PhotosInteractor photosInteractor;
  var page = 0;
  List<Photo> photos = [];

  PhotoCubit({required this.photosInteractor}): super(PhotoInitial()){
    getPhotos();
  }

  getPhotos() async{
    var newPhotos = await photosInteractor.getPhotos(++page);
    photos.addAll(newPhotos);
    emit(PhotoLoaded(photos: photos));
  }

}