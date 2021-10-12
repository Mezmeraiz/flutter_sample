import 'package:flutter_sample/screens/chart/domain/entities/company.dart';

abstract class ChartState {}

class ChartInitial extends ChartState {}

class ChartLoaded extends ChartState {

  final List<Company> companies;

  ChartLoaded({required this.companies});

}