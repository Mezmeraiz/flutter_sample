
class CompanyResponse {

  String? name;

  String? marketCapitalization;

  Map<String, dynamic> details;

  CompanyResponse.fromJson(Map<String, dynamic> json):
        name = json['Name'] as String,
        marketCapitalization = json['MarketCapitalization'] as String,
        details = json;

}