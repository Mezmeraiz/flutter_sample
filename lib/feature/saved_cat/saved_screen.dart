import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/saved_cat/saved_bloc.dart';
import 'package:flutter_sample/feature/saved_cat/saved_event.dart';
import 'package:flutter_sample/feature/saved_cat/saved_state.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/configurations/nested/cat_info_configuration.dart';
import 'package:flutter_sample/router/scope/router_scope.dart';
import 'package:flutter_sample/view/cat/cat_list_view.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DependencyScope.getBlocFactory(context).savedBloc..add(const SavedEvent.load()),
        child: const SavedView(),
      );
}

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  SavedViewState createState() => SavedViewState();
}

class SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.saved),
        ),
        body: BlocBuilder<SavedBloc, SavedState>(
          builder: (context, state) => CatListView(
            onTap: _onTapCat,
            cats: state.cats,
          ),
        ),
      );

  void _onTapCat(Cat cat) => RouterScope.of(context).push(
        CatInfoConfiguration(
          id: cat.id,
          saved: true,
        ),
      );
}
