import 'package:flutter_sample/data/api/cat/cat_api.dart';
import 'package:flutter_sample/data/api/cat/mapper/cat_dto_mapper.dart';
import 'package:flutter_sample/data/database/dao/cat_dao_impl.dart';
import 'package:flutter_sample/data/model/cat.dart';

abstract class CatRepository {
  Future<List<Cat>> fetchCats({
    required int page,
    required int results,
  });

  Future<Cat> fetchCat({required String id});

  Future<void> saveCat({required Cat cat});

  Future<List<Cat>> getSavedCats();

  Future<Cat> getSavedCat({required String id});
}

class CatRepositoryImpl implements CatRepository {
  CatApi catApi;
  CatDao catDao;

  CatRepositoryImpl({
    required this.catApi,
    required this.catDao,
  });

  @override
  Future<List<Cat>> fetchCats({
    required int page,
    required int results,
  }) async =>
      (await catApi.fetchCats(page: page, results: results)).map((e) => e.toCat()).toList();

  @override
  Future<Cat> fetchCat({required String id}) async => (await catApi.fetchCat(id: id)).toCat();

  @override
  Future<void> saveCat({required Cat cat}) => catDao.saveCat(cat: cat);

  @override
  Future<Cat> getSavedCat({required String id}) => catDao.getCat(id: id);

  @override
  Future<List<Cat>> getSavedCats() => catDao.getCats();
}
