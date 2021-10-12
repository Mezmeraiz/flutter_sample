import 'package:dio/dio.dart';
import 'package:flutter_sample/screens/chart/data/models/company_response.dart';
import 'package:retrofit/http.dart';

part 'companies_api.g.dart';

@RestApi(baseUrl: "https://www.alphavantage.co/")
abstract class CompaniesApi {
  factory CompaniesApi(Dio dio, {String baseUrl}) = _CompaniesApi;

  @GET('/query')
  Future<CompanyResponse> getCompany(@Query("symbol") String symbol, {
    @Query("function") String function = "OVERVIEW",
    @Query("apikey") String apiKey = "GSNMOZD36NST64N8"});

}