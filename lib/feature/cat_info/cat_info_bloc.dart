import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_sample/data/cat_repository.dart';
import 'package:flutter_sample/data/database/dao/cat_dao_impl.dart';
import 'package:flutter_sample/data/refresh_saved_repository.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_event.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_state.dart';

class CatInfoBloc extends Bloc<CatInfoEvent, CatInfoState> {
  final CatRepository catRepository;
  final RefreshSavedRepository refreshSavedRepository;

  CatInfoBloc({
    required this.catRepository,
    required this.refreshSavedRepository,
    required String id,
    required bool saved,
  }) : super(CatInfoState(
          id: id,
          saved: saved,
        )) {
    on<Load>(_load);
    on<Save>(_save, transformer: droppable());
  }

  Future<void> _load(
    Load event,
    Emitter<CatInfoState> emit,
  ) async {
    emit(state.copyWith(
      status: CatInfoStatus.loading,
    ));
    try {
      final cat = await (state.saved ? catRepository.getSavedCat(id: state.id) : catRepository.fetchCat(id: state.id));
      emit(state.copyWith(
        status: CatInfoStatus.data,
        cat: cat,
      ));
    } on CatNotFoundException {
      emit(state.copyWith(
        status: CatInfoStatus.catNotFound,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: CatInfoStatus.fetchError,
      ));
      rethrow;
    }
  }

  Future<void> _save(
    Save event,
    Emitter<CatInfoState> emit,
  ) async {
    if (state.status != CatInfoStatus.data) return;
    try {
      await catRepository.saveCat(cat: state.cat);
      refreshSavedRepository.refreshSaved();
      emit(state.copyWith(
        action: CatInfoAction.saved,
      ));
    } catch (_) {
      rethrow;
    } finally {
      emit(state.copyWith(
        action: CatInfoAction.none,
      ));
    }
  }
}
