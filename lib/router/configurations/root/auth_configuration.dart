import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/route_configuration.dart';

class AuthConfiguration extends RouteConfiguration {
  AuthConfiguration()
      : super(
          location: '/$authPath',
        );
}
