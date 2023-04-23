import 'package:flutter/material.dart';
import 'package:flutter_sample/router/route_configuration.dart';

class PageBuilder extends StatefulWidget {
  final RouteConfiguration configuration;
  final Widget Function(BuildContext, List<Page>) builder;
  final List<Page> Function() pageBuilder;

  const PageBuilder({
    Key? key,
    required this.builder,
    required this.pageBuilder,
    required this.configuration,
  }) : super(key: key);

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  List<Page> pages = [];
  late RouteConfiguration currentConfiguration;

  @override
  void initState() {
    pages = widget.pageBuilder();
    currentConfiguration = widget.configuration;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PageBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.configuration.location != widget.configuration.location) {
      pages = widget.pageBuilder();
      currentConfiguration = widget.configuration;
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, pages);
}
