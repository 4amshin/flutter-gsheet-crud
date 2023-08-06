import 'package:freezed_annotation/freezed_annotation.dart';

part 'koko_note_model.freezed.dart';
part 'koko_note_model.g.dart';

@freezed
class KokoNoteModel with _$KokoNoteModel {
  const factory KokoNoteModel({
    required int id,
    required String text,
  }) = _KokoNoteModel;

  factory KokoNoteModel.fromJson(Map<String, dynamic> json) =>
      _$KokoNoteModelFromJson(json);
}
