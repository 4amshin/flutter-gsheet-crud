part of 'get_notes_bloc.dart';

@freezed
class GetNotesEvent with _$GetNotesEvent {
  const factory GetNotesEvent.started() = _Started;
  const factory GetNotesEvent.getNotes() = _GetNotes;
}
