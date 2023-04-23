import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_sample/data/cat_repository.dart';
import 'package:flutter_sample/feature/cat/cat_event.dart';
import 'package:flutter_sample/feature/cat/cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository catRepository;

  CatBloc({required this.catRepository}) : super(const CatState()) {
    on<Fetch>(_fetch, transformer: droppable());
  }

  Future<void> _fetch(
    Fetch event,
    Emitter<CatState> emit,
  ) async {
    if (state.endOfList) return;
    emit(state.copyWith(
      status: state.status == CatStatus.data ? CatStatus.loading : CatStatus.initialLoading,
    ));
    try {
      final cats = await catRepository.fetchCats(page: state.page, results: 20);
      emit(state.copyWith(
        status: CatStatus.data,
        cats: state.cats + cats,
        page: state.page + 1,
        endOfList: cats.length < 20,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: state.status == CatStatus.initialLoading ? CatStatus.initialError : CatStatus.data,
      ));
      rethrow;
    }
  }
}
