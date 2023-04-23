import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/cat/cat_bloc.dart';
import 'package:flutter_sample/feature/cat/cat_event.dart';
import 'package:flutter_sample/feature/cat/cat_state.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/configurations/nested/cat_info_configuration.dart';
import 'package:flutter_sample/router/scope/router_scope.dart';
import 'package:flutter_sample/view/cat/cat_list_view.dart';
import 'package:flutter_sample/view/common/initial_error_view.dart';
import 'package:flutter_sample/view/common/initial_loading_view.dart';
import 'package:flutter_sample/view/common/loading_view.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DependencyScope.getBlocFactory(context).catBloc..add(const Fetch()),
        child: const CatView(),
      );
}

class CatView extends StatefulWidget {
  const CatView({Key? key}) : super(key: key);

  @override
  CatViewState createState() => CatViewState();
}

class CatViewState extends State<CatView> {
  final ScrollController scrollController = ScrollController();
  late final CatBloc catBloc;

  @override
  void initState() {
    super.initState();
    catBloc = context.read<CatBloc>();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        catBloc.add(const CatEvent.fetch());
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.cats),
        ),
        body: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) => state.status == CatStatus.initialLoading
              ? const InitialLoadingView()
              : state.status == CatStatus.initialError
                  ? InitialErrorView(onTapReload: _onTapReload)
                  : Column(
                      children: [
                        Expanded(
                          child: CatListView(
                            onTap: _onTapCat,
                            cats: state.cats,
                            scrollController: scrollController,
                          ),
                        ),
                        if (state.status == CatStatus.loading) const LoadingView(),
                      ],
                    ),
        ),
      );

  void _onTapCat(Cat cat) => RouterScope.of(context).push(
        CatInfoConfiguration(
          id: cat.id,
          saved: false,
        ),
      );

  void _onTapReload() => catBloc.add(const CatEvent.fetch());
}
