import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sample/data/cat_repository.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/data/refresh_saved_repository_impl.dart';
import 'package:flutter_sample/feature/saved_cat/saved_event.dart';
import 'package:flutter_sample/feature/saved_cat/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final CatRepository catRepository;
  final RefreshSavedRepository refreshSavedRepository;
  StreamSubscription<void>? _refreshSavedStreamSubscription;

  SavedBloc({
    required this.catRepository,
    required this.refreshSavedRepository,
  }) : super(const SavedState()) {
    on<Load>(_load);

    initSubscriptions();
  }

  void initSubscriptions() {
    _refreshSavedStreamSubscription =
        refreshSavedRepository.refreshSavedStream.listen((event) => add(const SavedEvent.load()));
  }

  Future<void> _load(
    Load event,
    Emitter<SavedState> emit,
  ) async {
    try {
      final List<Cat> cats = await catRepository.getSavedCats();
      emit(state.copyWith(
        cats: cats,
      ));
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> close() {
    _refreshSavedStreamSubscription?.cancel();
    return super.close();
  }
}
