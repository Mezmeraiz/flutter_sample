import 'package:flutter_sample/data/model/cat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_state.freezed.dart';

@freezed
class CatState with _$CatState {
  const factory CatState({
    @Default([]) List<Cat> cats,
    @Default(CatStatus.initialLoading) CatStatus status,
    @Default(0) int page,
    @Default(false) bool endOfList,
  }) = _CatState;
}

enum CatStatus {
  initialLoading,
  initialError,
  loading,
  data,
}
