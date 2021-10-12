import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/chart/domain/entities/company.dart';

class ChartInfoScreen extends StatelessWidget {

  static const route = "chart_info";

  final Company company;

  const ChartInfoScreen(this.company);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: ListView.separated(
          itemCount: company.details.length,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: Colors.black,
          ),
          itemBuilder: (_, position) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(8),
                      child: Text(company.details[position].name),
                    )
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(8),
                      child: Text(company.details[position].value),
                    )
                )
              ],
            );
          })
    );
  }


}