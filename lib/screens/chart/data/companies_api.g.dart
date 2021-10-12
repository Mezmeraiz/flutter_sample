// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CompaniesApi implements CompaniesApi {
  _CompaniesApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://www.alphavantage.co/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  getCompany(symbol,
      {function = "OVERVIEW", apiKey = "GSNMOZD36NST64N8"}) async {
    ArgumentError.checkNotNull(symbol, 'symbol');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'symbol': symbol,
      'function': function,
      'apikey': apiKey
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/query',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CompanyResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
