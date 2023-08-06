import 'package:flutter/material.dart';
import 'package:koko_note/api/gsheet_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koko_note/presentation/home_view/view/home_page.dart';
import 'package:koko_note/shared/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GsheetApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBlocProvider(
      child: MaterialApp(
        title: "Koko Note",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
