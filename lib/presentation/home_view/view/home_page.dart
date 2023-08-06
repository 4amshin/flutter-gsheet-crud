import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko_note/api/gsheet_api.dart';
import 'package:koko_note/blocs/get_notes/get_notes_bloc.dart';
import 'package:koko_note/data/model/note_model.dart';
import 'package:koko_note/presentation/home_view/widgets/g_input_field.dart';
import 'package:koko_note/presentation/home_view/widgets/g_notes_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  List<NoteModel> notes = [];

  @override
  void initState() {
    context.read<GetNotesBloc>().add(const GetNotesEvent.getNotes());
    super.initState();
  }

  void _post() {
    log('Input : ${_textController.text}');

    //generate unik id using timestamp
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString().substring(
          2,
        );

    final genId = "$hour$minute$second$day$month$year";
    log('Generated Id : $genId');

    GsheetApi.addNote(
      note: NoteModel(id: int.parse(genId), text: _textController.text),
    );
    _textController.clear();
    context.read<GetNotesBloc>().add(const GetNotesEvent.getNotes());
    setState(() {});
  }

  void _delete() async {
    await GsheetApi.delete(id: 213002060823);
    log("Deleting id....");
    context.read<GetNotesBloc>().add(const GetNotesEvent.getNotes());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GetNotesBloc>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "P O S T   A   N O T E",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<GetNotesBloc, GetNotesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (notes) => RefreshIndicator(
                    onRefresh: () async =>
                        bloc.add(const GetNotesEvent.getNotes()),
                    child: GNotesGrid(notes: notes),
                  ),
                  orElse: () => const Center(child: Text("No Data")),
                );
              },
            ),
          ),
          GInputField(
            controller: _textController,
            onClear: () => _textController.clear(),
            onPost: () => _post(),
          ),
        ],
      ),
    );
  }
}
