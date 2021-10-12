import 'package:flutter_sample/screens/chart/domain/entities/company.dart';

abstract class CompaniesInteractor {

  Future<List<Company>> getCompanies();

}