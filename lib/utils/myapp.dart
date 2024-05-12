import 'package:voice_recorder_2/utils/headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff22092C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff22092C),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
      ),
      routes: AppRoutes.routes,
    );
  }
}
