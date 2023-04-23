import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/route_configuration.dart';

class SavedInfoConfiguration extends RouteConfiguration {
  SavedInfoConfiguration({required String id})
      : super(
          location: '/$savedPath/$catInfoPath?id=$id&saved=true',
        );
}
