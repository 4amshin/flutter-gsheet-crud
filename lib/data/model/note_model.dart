class NoteModel {
  const NoteModel({
    required this.id,
    required this.text,
  });

  final int id;
  final String text;

  factory NoteModel.fromGSheets(Map<String, dynamic> json) {
    return NoteModel(
      id: int.parse(json['id']),
      text: json['text'],
    );
  }

  Map<String, dynamic> toGSheets() {
    return {
      'id': id.toString(),
      'text': text,
    };
  }

  @override
  String toString() => 'NoteModel{id: $id, text: $text}';
}
