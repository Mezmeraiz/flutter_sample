import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/note/note_list_item.dart';
import 'package:flutter_sample/presentation/screens/note/store/note_store.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_list_item.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';
import 'package:flutter_svg/svg.dart';

class NoteScreen extends StatefulWidget {
  static const route = "saved";

  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NoteScreenState();
}

class NoteScreenState extends State<NoteScreen>
    with AutomaticKeepAliveClientMixin<NoteScreen> {

  late final NoteStore _noteStore;

  @override
  void initState() {
    super.initState();
    _noteStore = context.read<NoteStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Note"),
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
                itemCount: _noteStore.notes.length,
                itemBuilder: (_, index) {
                  return NoteListItem(position: index);
                });
          },
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
