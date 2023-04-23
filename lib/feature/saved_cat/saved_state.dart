import 'package:flutter_sample/data/model/cat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_state.freezed.dart';

@freezed
class SavedState with _$SavedState {
  const factory SavedState({
    @Default([]) List<Cat> cats,
  }) = _SavedState;
}
