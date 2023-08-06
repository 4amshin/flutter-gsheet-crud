part of 'get_notes_bloc.dart';

@freezed
class GetNotesState with _$GetNotesState {
  const factory GetNotesState.initial() = _Initial;
  const factory GetNotesState.loading() = _Loading;
  const factory GetNotesState.loaded({
    required List<KokoNoteModel> notes,
  }) = _Loaded;
  const factory GetNotesState.error({
    required String message,
  }) = _Error;
}
