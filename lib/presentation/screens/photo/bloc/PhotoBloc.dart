import 'package:bloc/bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'PhotoBloc.freezed.dart';

@freezed
class PhotoEvent with _$PhotoEvent {
  const PhotoEvent._();

  const factory PhotoEvent.fetch() = FetchPhotoEvent;

  const factory PhotoEvent.select({required Photo selectedPhoto}) = SelectPhotoEvent;
}

@freezed
class PhotoState with _$PhotoState {
  const PhotoState._();

  int get page => map(
      initial: (_) => 1,
      fetched: (state) => state.page,
      error: (state) => state.page,
      selected: (state) => state.page);

  List<Photo> get photos => map(
      initial: (_) => [],
      fetched: (state) => state.photos,
      error: (state) => state.photos,
      selected: (state) => state.photos);

  Set<Photo> get selectedPhotos => map(
      initial: (_) => {},
      fetched: (state) => state.selectedPhotos,
      error: (state) => state.selectedPhotos,
      selected: (state) => state.selectedPhotos);

  const factory PhotoState.initial() = InitialPhotoState;

  const factory PhotoState.fetched({
    required List<Photo> photos,
    required int page,
    required Set<Photo> selectedPhotos,
  }) = FetchedPhotoState;

  const factory PhotoState.error({
    required List<Photo> photos,
    required int page,
    required Set<Photo> selectedPhotos,
    String? message,
  }) = ErrorPhotoState;

  const factory PhotoState.selected({
    required List<Photo> photos,
    required int page,
    required Photo selectedPhoto,
    required Set<Photo> selectedPhotos,
  }) = SelectedPhotoState;
}

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({required this.photosInteractor, required this.userRouterRepository})
      : super(const PhotoState.initial()) {
    on<FetchPhotoEvent>(_fetch);
    on<SelectPhotoEvent>(_select);
  }

  final PhotosInteractor photosInteractor;

  final UserRouterRepository userRouterRepository;

  Future<void> _fetch(
    FetchPhotoEvent event,
    Emitter<PhotoState> emit,
  ) async {
    try {
      var page = state.page;
      final photos = state.photos;
      var newPhotos = await photosInteractor.getPhotos(page++);
      emit(PhotoState.fetched(
          photos: List.of(photos)..addAll(newPhotos),
          page: page,
          selectedPhotos: state.selectedPhotos));
    } on DioError catch (e) {
      emit(PhotoState.error(
          photos: state.photos,
          page: state.page,
          selectedPhotos: state.selectedPhotos,
          message: e.message));
    } catch (_) {
      emit(PhotoState.error(
          photos: state.photos, page: state.page, selectedPhotos: state.selectedPhotos));
    }
  }

  Future<void> _select(
    SelectPhotoEvent event,
    Emitter<PhotoState> emit,
  ) async {
    var selectedPhoto = event.selectedPhoto;
    final selectedPhotos = userRouterRepository.selectedPhotosStreamController.value;
    selectedPhotos.contains(selectedPhoto)
        ? selectedPhotos.remove(selectedPhoto)
        : selectedPhotos.add(selectedPhoto);
    userRouterRepository.selectedPhotosStreamController.add(selectedPhotos);
    emit(PhotoState.selected(
        page: state.page,
        photos: state.photos,
        selectedPhoto: selectedPhoto,
        selectedPhotos: Set.of(selectedPhotos)));
  }
}
