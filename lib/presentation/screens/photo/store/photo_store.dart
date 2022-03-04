import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:mobx/mobx.dart';

part 'photo_store.g.dart';

class PhotoStore = PhotoStoreBase with _$PhotoStore;

abstract class PhotoStoreBase with Store {

  PhotosInteractor photosInteractor;

  PhotoStoreBase({required this.photosInteractor}){
    getPhotos();
  }

  var page = 0;

  @observable
  var photos = ObservableList<Photo>();

  @observable
  var selectedPhotos = ObservableSet<Photo>();

  @action
  getPhotos() async{
    var newPhotos = await photosInteractor.getPhotos(++page);
    photos.addAll(newPhotos);
  }

  @action
  onTapPhoto(int position) async{
    var photo = photos[position];
    selectedPhotos.contains(photo) ? selectedPhotos.remove(photo) : selectedPhotos.add(photo);
  }

}