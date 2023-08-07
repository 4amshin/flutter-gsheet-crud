import 'dart:convert';
import 'dart:developer';

import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:koko_note/data/api/gsheet_api.dart';
import 'package:koko_note/data/model/koko_note_model.dart';

class NotesDataSources {
  final Worksheet? gsheet = GsheetApi.worksheet;

  Future<Either<String, List<KokoNoteModel>>> getNotes() async {
    const baseUrl =
        "https://script.googleusercontent.com/macros/echo?user_content_key=PaYTRRnGq87--OBufr8Js-AR6KMIB_wp0YocWaSO4u8UG00J_JXUPsP5vro0yxARMU9iVJ9AZ32y4cXdK4sLotwaABcb8Kf5m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnHGdJj-94LLrXpeF4nhwnmQcDBUWAJwTYy67cfAReBsniI7nly6VTM01Xqtp2R9zI5-9me_G4VkMNvkmusGm03f24GSltrD7Dg&lib=M-V7YKQLY7HS8DSNYuHm57WX7-SJk8D0n";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      log(jsonData.toString());
      final List<KokoNoteModel> kokoNotes = List<KokoNoteModel>.from(
          jsonData.map((item) => KokoNoteModel.fromJson(item)));

      return Right(kokoNotes);
    } else {
      return const Left("Failed Fetch Notes Data");
    }
  }

  Future<void> addNote({required KokoNoteModel note}) async {
    if (gsheet != null) {
      try {
        await gsheet!.values.map.appendRow(note.toJson());
        log('New addNote: ${note.toJson().toString()}');
      } catch (e) {
        log("Error adding note: $e");
      }
    } else {
      log("Worksheet null");
    }
  }

  Future<void> updateNote({required KokoNoteModel note}) async {
    if (gsheet != null) {
      final index = await gsheet?.values.map.rowByKey(note.id);
      if (index != null) {
        try {
          await gsheet?.values.map.insertRowByKey(
            note.id,
            note.toJson(),
            fromColumn: 2,
            overwrite: true,
          );
          log("Note Updated Successfully.");
        } catch (e) {
          log("Error Updating Note : $e");
        }
      } else {
        log("Note not found, inserting a new row.....");
        await gsheet?.values.map.appendRow(note.toJson());
      }
    } else {
      log("Worksheet null");
    }
  }

  Future<void> deleteNote({required int id}) async {
    if (gsheet != null) {
      final index = await gsheet?.values.rowIndexOf(id);
      try {
        await gsheet?.deleteRow(index!);
        log("Note with id($id) is deleted successfully.");
      } catch (e) {
        log("Error Deleting Note with id($id) : $e");
      }
    } else {
      log("Worksheet Null");
    }
  }
}
