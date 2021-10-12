import 'package:flutter_sample/screens/chart/data/models/company_response.dart';
import 'package:flutter_sample/screens/chart/domain/entities/company.dart';

extension CompanyResponseMapper on CompanyResponse {

  Company toCompany() {
    return Company(
        name: name ?? "None",
        marketCapitalization: int.parse(marketCapitalization ?? "0") ,
        details: details.entries.map((e) => Detail(name: e.key, value: e.value)).toList()
    );
  }

}