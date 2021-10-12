import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/injection_container.dart';
import 'package:flutter_sample/screens/chart_info/presentation/chart_info_screen.dart';
import 'chart_cubit.dart';
import 'chart_state.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartScreen extends StatelessWidget {

  static const route = "chart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Companies"),
      ),
      body: BlocBuilder<ChartCubit, ChartState>(
        builder: (context, state) {
          if (state is ChartLoaded) {
            return Center(
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (event , pieTouchResponse){
                          if (event is FlTapDownEvent || event is FlPointerHoverEvent) {
                            Navigator.pushNamed(context, ChartInfoScreen.route,
                                arguments: state.companies[pieTouchResponse!.touchedSection!.touchedSectionIndex]);
                          }
                        }
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: state.companies.map((company) => PieChartSectionData(
                      color: Color(sl<Random>().nextInt(0xffffffff)),
                      value: company.marketCapitalization.toDouble(),
                      title: company.name,
                      radius: MediaQuery.of(context).size.width / 2 - 16,
                      titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                      titlePositionPercentageOffset: 0.55,
                    )).toList()
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }


}
