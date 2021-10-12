import 'package:flutter_sample/core/utils.dart';
import 'package:flutter_sample/screens/chart/data/companies_api.dart';
import 'package:flutter_sample/screens/chart/data/models/company_response.dart';
import 'package:flutter_sample/screens/chart/data/mapper/company_response_mapper.dart';
import 'package:flutter_sample/screens/chart/domain/entities/company.dart';
import 'companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {

  CompaniesApi companiesApi;

  CompaniesRepositoryImpl({required this.companiesApi});

  @override
  Future<Company> getCompany(String symbol) async {
    var companyResponse = await retryHttpCall<CompanyResponse>(() => companiesApi.getCompany(symbol));
    return companyResponse.toCompany();
  }

}