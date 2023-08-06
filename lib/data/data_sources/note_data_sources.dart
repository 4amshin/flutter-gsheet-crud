import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:koko_note/data/model/koko_note_model.dart';

class NotesDataSources {
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
}
