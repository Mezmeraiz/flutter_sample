import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_sample/data/database/dao/cat_dao_impl.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/data/storage/storage.dart';

class CatDaoWebImpl implements CatDao {
  final Storage storage;

  CatDaoWebImpl({required this.storage});

  @override
  Future<void> saveCat({required Cat cat}) async {
    final List<Cat> cats = await getCats();
    cats.add(cat);
    await storage.saveCats(json: jsonEncode(cats));
  }

  @override
  Future<List<Cat>> getCats() async {
    final json = storage.cats;
    return json != null
        ? (jsonDecode(json) as List<dynamic>).map((e) => Cat.fromJson(e as Map<String, dynamic>)).toList()
        : [];
  }

  @override
  Future<Cat> getCat({required String id}) async {
    final Cat? cat = (await getCats()).firstWhereOrNull((cat) => cat.id == id);
    return cat ?? (throw CatNotFoundException());
  }
}
