import 'package:flutter_sample/data/model/cat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_info_state.freezed.dart';

@freezed
class CatInfoState with _$CatInfoState {
  const factory CatInfoState({
    @Default('') String id,
    @Default(Cat()) Cat cat,
    @Default(CatInfoStatus.loading) CatInfoStatus status,
    @Default(CatInfoAction.none) CatInfoAction action,
  }) = _CatInfoState;
}

enum CatInfoStatus {
  loading,
  fetchError,
  catNotFound,
  data,
}

enum CatInfoAction {
  none,
  saved,
}
