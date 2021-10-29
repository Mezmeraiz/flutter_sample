// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PhotosApi implements PhotosApi {
  _PhotosApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.unsplash.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<PhotoDTO>> getPhotos(page,
      {clientId = "wM_AxsrrX3XZCPR81_vwHnAcwW9hWp-jYCATG7eK2qM"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'client_id': clientId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PhotoDTO>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/photos',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => PhotoDTO.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
