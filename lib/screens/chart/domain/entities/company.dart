
class Company {

  final String name;
  final int marketCapitalization;
  final List<Detail> details;

  Company({
    required this.name,
    required this.marketCapitalization,
    required this.details,
  });

}

class Detail {

  final String name;
  final String value;

  Detail({
    required this.name,
    required this.value,
  });

}