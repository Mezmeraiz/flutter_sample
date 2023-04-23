import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_event.freezed.dart';

@freezed
class CatEvent with _$CatEvent {
  const factory CatEvent.fetch() = Fetch;
}
