import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_info_event.freezed.dart';

@freezed
class CatInfoEvent with _$CatInfoEvent {
  const factory CatInfoEvent.load() = Load;

  const factory CatInfoEvent.save() = Save;
}
