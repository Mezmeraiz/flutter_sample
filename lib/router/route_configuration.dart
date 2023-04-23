import 'dart:async';

class RouteConfiguration<T extends Object?> {
  RouteConfiguration({
    required this.location,
    this.state,
    this.popCompleter,
  });

  late String location;

  Map<String, Object?>? state;

  final Completer<T?>? popCompleter;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RouteConfiguration && other.location == location && other.state == state;
  }

  @override
  @override
  int get hashCode => Object.hash(location, state);
}
