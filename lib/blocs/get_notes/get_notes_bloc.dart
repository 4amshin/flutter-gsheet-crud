import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koko_note/data/data_sources/note_data_sources.dart';
import 'package:koko_note/data/model/koko_note_model.dart';

part 'get_notes_event.dart';
part 'get_notes_state.dart';
part 'get_notes_bloc.freezed.dart';

class GetNotesBloc extends Bloc<GetNotesEvent, GetNotesState> {
  final NotesDataSources dataSources;

  GetNotesBloc(this.dataSources) : super(const _Initial()) {
    on<_GetNotes>(_getNotes);
  }

  Future<void> _getNotes(
    _GetNotes event,
    Emitter<GetNotesState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSources.getNotes();
    result.fold(
      (error) => emit(_Error(message: error)),
      (data) => emit(_Loaded(notes: data)),
    );
  }
}
