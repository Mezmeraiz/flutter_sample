import 'package:flutter_sample/screens/chart/domain/entities/company.dart';

abstract class CompaniesRepository {

  Future<Company> getCompany(String symbol);

}