// import 'package:voice_recorder_2/utils/globals.dart';
// import 'package:voice_recorder_2/utils/headers.dart';
//
// GestureDetector micButton(
//     {required BuildContext context, required Function reset}) {
//   return GestureDetector(
//     onTap: () {
//       if (Globals.instance.isRecording) {
//         showDialog(
//           context: context,
//           builder: (context) => Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff22092C),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0xffBE3144),
//                       spreadRadius: 3,
//                       blurRadius: 5,
//                       offset: Offset(2, 2),
//                     ),
//                     BoxShadow(
//                       color: Colors.white,
//                       spreadRadius: 3,
//                       blurRadius: 5,
//                       offset: Offset(-2, -2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     //File Name
//                     Container(
//                       margin: const EdgeInsets.all(20),
//                       height: 50,
//                       color: const Color(0xff22092C),
//                       child: Material(
//                         child: TextField(
//                           controller: Globals.instance.controller,
//                           textAlignVertical: TextAlignVertical.center,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             isDense: true,
//                             fillColor: const Color(0xff22092C),
//                             // border: OutlineInputBorder(),
//                             contentPadding: const EdgeInsets.all(12),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         //Cancel Button
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: const Color(0xffBE3144),
//                             ),
//                             alignment: Alignment.center,
//                             child: const Text(
//                               'Cancel',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                           ),
//                         ),
// //Save Button
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                             if (Globals.instance.controller.text.isNotEmpty) {
//                               startTimer(reset: reset);
//                               Globals.instance.start();
//                               // Globals.instance.isRecording = false;
//                               Globals.instance.isRecording = false;
//                               reset();
//                             }
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: const Color(0xffBE3144),
//                             ),
//                             alignment: Alignment.center,
//                             child: const Text(
//                               'Save',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       } else {
//         stop();
//         Globals.instance.timer?.cancel();
//         Globals.instance.isRecording = true;
//         Globals.instance.time = 0;
//         reset();
//       }
//     },
//     child: Container(
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xffBE3144),
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: Offset(3, 3),
//           ),
//           BoxShadow(
//             color: Colors.white,
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: Offset(-3, -3),
//           ),
//         ],
//       ),
//       child: const CircleAvatar(
//         radius: 70,
//         backgroundColor: Color(0xff22092C),
//         child: Icon(Icons.mic_rounded, size: 100, color: Colors.white),
//       ),
//     ),
//   );
// }
