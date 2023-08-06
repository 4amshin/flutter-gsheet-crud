// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko_note/api/gsheet_api.dart';
import 'package:koko_note/blocs/get_notes/get_notes_bloc.dart';

import 'package:koko_note/data/model/koko_note_model.dart';
import 'package:koko_note/data/model/note_model.dart';

class DetailView extends StatefulWidget {
  final KokoNoteModel note;
  const DetailView({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.note.text;
    log("Text with id = ${widget.note.id}");
    super.initState();
  }

  void _update() async {
    log("Updating.....");
    await GsheetApi.updateNote(
      note: NoteModel(
        id: widget.note.id,
        text: textController.text,
      ),
    );
    textController.clear();

    log("Back to Home");
    Navigator.pop(context);
    context.read<GetNotesBloc>().add(const GetNotesEvent.getNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: TextField(
            controller: textController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _update(),
        child: const Icon(Icons.save),
      ),
    );
  }
}
