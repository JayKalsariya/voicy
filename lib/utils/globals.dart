import 'dart:developer';

import 'package:voice_recorder_2/utils/headers.dart';

class Globals {
  Globals._();

  static final Globals instance = Globals._();

  final record = Record();
  final OnAudioQuery audioQuery = OnAudioQuery();
  final TextEditingController controller = TextEditingController();

  Timer? timer;
  int time = 0;
  bool isRecording = true;
  bool visible = false;
  // String? _recordingPath;

//   requestPermission({required dynamic reset}) async {
//     if (!kIsWeb) {
//       bool permissionStatus = await audioQuery.permissionsStatus();
//       if (!permissionStatus) {
//         await audioQuery.permissionsRequest();
//       }
//       // setState(() {
//       //   log('Permission status: $permissionStatus');
//       // });
//       reset();
//     }
//   }
//
//   void startTimer({required dynamic reset}) {
//     const oneSec = Duration(seconds: 1);
//     timer = Timer.periodic(oneSec, (Timer timer) {
//       // time++;
//       // setState(() {
//       //   time++;
//       // });
//       time++;
//       reset();
//     });
//   }
//
//   Future<void> start() async {
//     const folderName = 'VoiceRecorder';
//     try {
//       if (await record.hasPermission()) {
//         Directory? dir;
//         if (Platform.isIOS) {
//           dir = await getApplicationDocumentsDirectory();
//         } else {
//           dir = Directory('/storage/emulated/0/Recordings');
//           // dir = Directory('/storage/Music/Recordings/Standard Recordings');
//           if (!await dir.exists()) dir = (await getExternalStorageDirectory())!;
//         }
//
//         await record.start(
//           path:
//               // '${dir.path}/_controller${DateTime.now().millisecondsSinceEpoch}.mp3',
//               '${dir.path}/${controller.text}.mp3',
//         );
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> stop() async {
//     final path = await record.stop();
//     // var _audioPath = path;
//     if (path?.isEmpty ?? false) {
//       log(path ?? '');
//     }
//   }
//
//   String formatTime({required int seconds}) {
//     return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
//   }
}
