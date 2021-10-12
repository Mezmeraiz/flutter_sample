import 'package:flutter_sample/screens/chart/data/companies_repository.dart';
import 'companies_interactor.dart';
import 'entities/company.dart';

class CompaniesInteractorImpl implements CompaniesInteractor {

  CompaniesRepository companiesRepository;

  CompaniesInteractorImpl({required this.companiesRepository});

  @override
  Future<List<Company>> getCompanies() async{
    var futures = ["AAPL", "AMZN", "GOOG", "MSFT", "FB", "NFLX"]
        .map((symbol) => companiesRepository.getCompany(symbol));
    return await Future.wait(futures);
  }

}