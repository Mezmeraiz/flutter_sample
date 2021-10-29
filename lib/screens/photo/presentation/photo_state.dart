import 'package:flutter_sample/screens/photo/domain/entities/photo.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<Photo> photos;
  PhotoLoaded({required this.photos});
}