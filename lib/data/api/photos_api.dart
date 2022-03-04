import 'package:dio/dio.dart';
import 'package:flutter_sample/data/model/photo_dto.dart';
import 'package:retrofit/http.dart';

part 'photos_api.g.dart';

@RestApi(baseUrl: "https://api.unsplash.com/")
abstract class PhotosApi {
  factory PhotosApi(Dio dio, {String baseUrl}) = _PhotosApi;

  @GET('/photos')
  Future<List<PhotoDTO>> getPhotos(@Query("page") int page, {
    @Query("client_id") String clientId = "wM_AxsrrX3XZCPR81_vwHnAcwW9hWp-jYCATG7eK2qM"});

}