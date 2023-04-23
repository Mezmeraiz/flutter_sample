import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/route_configuration.dart';

class CatInfoConfiguration extends RouteConfiguration {
  CatInfoConfiguration({required String id, required bool saved})
      : super(
          location: '/$catInfoPath?id=$id&saved=$saved',
        );
}
