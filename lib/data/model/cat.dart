import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat.freezed.dart';
part 'cat.g.dart';

@freezed
class Cat with _$Cat {
  const Cat._();

  const factory Cat({
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'breed') @Default('') String breed,
    @JsonKey(name: 'picture') @Default('') String picture,
  }) = _Cat;

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
}
