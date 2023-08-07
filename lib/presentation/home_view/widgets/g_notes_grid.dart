// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko_note/blocs/get_notes/get_notes_bloc.dart';
import 'package:koko_note/data/data_sources/note_data_sources.dart';

import 'package:koko_note/data/model/koko_note_model.dart';
import 'package:koko_note/presentation/detail_view/view/detail_view.dart';
import 'package:koko_note/presentation/home_view/widgets/g_text_box.dart';

class GNotesGrid extends StatelessWidget {
  final List<KokoNoteModel> notes;
  const GNotesGrid({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _delete({required int id}) async {
      // await GsheetApi.delete(id: id);
      await NotesDataSources().deleteNote(id: id);
      context.read<GetNotesBloc>().add(const GetNotesEvent.getNotes());
    }

    return SafeArea(
      minimum: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final kokoNote = notes[index];
          return GTextBox(
            text: kokoNote.text,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailView(note: kokoNote)),
              );
            },
            onDelete: () => _delete(id: kokoNote.id),
          );
        },
      ),
    );
  }
}
