// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko_note/blocs/get_notes/get_notes_bloc.dart';
import 'package:koko_note/data/data_sources/note_data_sources.dart';

class SimpleBlocProvider extends StatelessWidget {
  final Widget child;
  const SimpleBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNotesBloc(NotesDataSources()),
        )
      ],
      child: child,
    );
  }
}
