import 'package:voice_recorder_2/layouts/splashscreen/splash_screen.dart';
import 'package:voice_recorder_2/layouts/voicechange/voice_change.dart';
import 'package:voice_recorder_2/utils/headers.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String homePage = 'homePage';
  static const String listPage = 'listPage';
  static const String voiceChange = 'voiceChange';

  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SplashScreen(),
    'homePage': (context) => const HomePage(),
    'listPage': (context) => const ListPage(),
    'voiceChange': (context) => const VoiceChanger(),
  };
}
