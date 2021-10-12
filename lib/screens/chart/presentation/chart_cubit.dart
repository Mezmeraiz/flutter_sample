import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/screens/chart/domain/companies_interactor.dart';

import 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {

  CompaniesInteractor companiesInteractor;

  ChartCubit({required this.companiesInteractor}): super(ChartInitial()){
    getCompanies();
  }

  getCompanies() async{
    var companies = await companiesInteractor.getCompanies();
    emit(ChartLoaded(companies: companies));
  }

}