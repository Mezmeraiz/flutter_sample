import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/presentation/screens/note/bloc/note_bloc.dart';
import 'package:flutter_sample/presentation/screens/note/note_list_item.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NoteScreenState();
}

class NoteScreenState extends State<NoteScreen> with AutomaticKeepAliveClientMixin<NoteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(const NoteEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.notes),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (_, index) {
              return NoteListItem(note: state.notes[index]);
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
