import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_bloc.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_event.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_state.dart';
import 'package:flutter_sample/feature/cat_info/widget/cat_not_found_view.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/configurations/nested/saved_info_configuration.dart';
import 'package:flutter_sample/router/root_route_information_parser.dart';
import 'package:flutter_sample/router/scope/router_scope.dart';
import 'package:flutter_sample/router/tab_router.dart';
import 'package:flutter_sample/view/common/base_network_image.dart';
import 'package:flutter_sample/view/common/initial_error_view.dart';
import 'package:flutter_sample/view/common/initial_loading_view.dart';

class CatInfoScreen extends StatelessWidget {
  final String id;
  final bool saved;

  const CatInfoScreen({
    Key? key,
    required this.id,
    required this.saved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyScope.getBlocFactory(context).getCatInfoBloc(
        id: id,
        saved: saved,
      )..add(const CatInfoEvent.load()),
      child: CatInfoView(saved: saved),
    );
  }
}

class CatInfoView extends StatelessWidget {
  final bool saved;

  const CatInfoView({
    Key? key,
    required this.saved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<CatInfoBloc, CatInfoState>(
        listenWhen: (prev, curr) => prev.action != curr.action && curr.action != CatInfoAction.none,
        listener: (context, state) {
          if (state.action == CatInfoAction.saved) {
            _onCatSaved(
              context,
              state.id,
            );
          }
        },
        buildWhen: (prev, curr) => prev.action == curr.action || curr.action == CatInfoAction.none,
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(state.cat.breed),
            actions: [
              if (!saved)
                IconButton(
                  icon: const Icon(Icons.save),
                  tooltip: S.current.saveCat,
                  onPressed: () => _onTapSave(context),
                ),
            ],
          ),
          body: _getContent(
            state,
            context,
          ),
        ),
      );

  Widget _getContent(
    CatInfoState state,
    BuildContext context,
  ) {
    switch (state.status) {
      case CatInfoStatus.loading:
        return const InitialLoadingView();
      case CatInfoStatus.catNotFound:
        return const CatNotFountView();
      case CatInfoStatus.fetchError:
        return InitialErrorView(onTapReload: () => _onTapReload(context));
      case CatInfoStatus.data:
        return Center(
          child: BaseNetworkImage(imageUrl: state.cat.picture),
        );
    }
  }

  void _onTapSave(BuildContext context) => context.read<CatInfoBloc>().add(const CatInfoEvent.save());

  void _onTapReload(BuildContext context) => context.read<CatInfoBloc>().add(const CatInfoEvent.load());

  void _onCatSaved(
    BuildContext context,
    String id,
  ) async {
    await RouterScope.of(context).pop();
    TabRouter.of(context).delegateByPath(savedPath).navigate(SavedInfoConfiguration(id: id));
  }
}
