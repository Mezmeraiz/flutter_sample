import 'package:dio/dio.dart';
import 'package:flutter_sample/common/constants.dart';
import 'package:flutter_sample/data/api/cat/dto/cat_dto.dart';
import 'package:retrofit/http.dart';

part 'cat_api.g.dart';

@RestApi()
abstract class CatApi {
  factory CatApi(Dio dio, {String baseUrl}) = _CatApi;

  @GET('/images/search')
  Future<List<CatDTO>> fetchCats({
    @Query('page') required int page,
    @Query('limit') required int results,
    @Query('api_key') String apiKey = Constants.apiKey,
    @Query('has_breeds') int hasBreeds = 1,
  });

  @GET('/images/{id}')
  Future<CatDTO> fetchCat({@Path('id') required String id});
}
