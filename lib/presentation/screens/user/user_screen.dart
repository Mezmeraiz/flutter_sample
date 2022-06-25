import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/di/interactor_storage.dart';
import 'package:flutter_sample/presentation/screens/user/bloc/user_bloc.dart';
import 'package:flutter_sample/presentation/screens/user/user_list_item.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, this.gender}) : super(key: key);

  final String? gender;

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> with AutomaticKeepAliveClientMixin<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        gender: widget.gender,
        userInteractor: context.read<InteractorStorage>().usersInteractor,
      )..add(const FetchUserEvent()),
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is InitialUserState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (_, index) {
                  return UserListItem(user: state.users[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
