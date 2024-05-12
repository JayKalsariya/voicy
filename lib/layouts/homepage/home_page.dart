import 'dart:developer';

import 'package:voice_recorder_2/utils/globals.dart';
import 'package:voice_recorder_2/utils/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController anicontroller;
  int i = 0;
  reset() {
    setState(() {});
  }

  @override
  void initState() {
    requestPermission();
    super.initState();
    anicontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    anicontroller.addListener(() {
      if (i == 6) {
        i = 0;
      } else {
        i++;
      }
      reset();
    });
  }

  // animate() {
  //   final curved =
  //       CurvedAnimation(parent: animation!, curve: Curves.easeInOutCubic);
  //   anicontroller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 10000),
  //   );
  //   animation = Tween<double>(begin: 0, end: 100).animate(anicontroller!)
  //     ..addListener(() {
  //       setState(() {});
  //     });
  //   anicontroller!.repeat(reverse: true);
  // }

  requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus =
          await Globals.instance.audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await Globals.instance.audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Globals.instance.timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        Globals.instance.time++;
      });
    });
  }

  Future<void> start() async {
    try {
      if (await Globals.instance.record.hasPermission()) {
        Directory? dir;
        if (Platform.isIOS) {
          dir = await getApplicationDocumentsDirectory();
        } else {
          dir = Directory('/storage/emulated/0/Recordings');
          // dir = Directory('/storage/Music/Recordings/Standard Recordings');
          if (!await dir.exists()) dir = (await getExternalStorageDirectory())!;
        }

        await Globals.instance.record.start(
          path:
              // '${dir.path}/Globals.instance.controller${DateTime.now().millisecondsSinceEpoch}.mp3',
              '${dir.path}/${Globals.instance.controller.text}.m4a',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> stop() async {
    final path = await Globals.instance.record.stop();
    // var _audioPath = path;
    if (path?.isEmpty ?? false) {
      log(path ?? '');
    }
  }

  String formatTime({required int seconds}) {
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    Globals.instance.timer?.cancel();
    Globals.instance.record.dispose();
    Globals.instance.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recorder'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.listPage);
              setState(() {});
            },
            icon: const Icon(Icons.list_alt_rounded),
          )
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Mic Button
//             GestureDetector(
//               onTap: () {
//                 if (Globals.instance.isRecording) {
//                   showDialog(
//                     context: context,
//                     builder: (context) => Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 150,
//                           width: 300,
//                           decoration: BoxDecoration(
//                             color: const Color(0xff22092C),
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color(0xffBE3144),
//                                 spreadRadius: 3,
//                                 blurRadius: 5,
//                                 offset: Offset(2, 2),
//                               ),
//                               BoxShadow(
//                                 color: Colors.white,
//                                 spreadRadius: 3,
//                                 blurRadius: 5,
//                                 offset: Offset(-2, -2),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               //File Name
//                               Container(
//                                 margin: const EdgeInsets.all(20),
//                                 height: 50,
//                                 color: const Color(0xff22092C),
//                                 child: Material(
//                                   child: TextField(
//                                     controller: Globals.instance.controller,
//                                     textAlignVertical: TextAlignVertical.center,
//                                     decoration: InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(10.0),
//                                       ),
//                                       isDense: true,
//                                       fillColor: const Color(0xff22092C),
//                                       // border: OutlineInputBorder(),
//                                       contentPadding: const EdgeInsets.all(12),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   //Cancel Button
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Container(
//                                       height: 40,
//                                       width: 80,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: const Color(0xffBE3144),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: const Text(
//                                         'Cancel',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           decoration: TextDecoration.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   //Save Button
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                       if (Globals.instance.controller.text.isNotEmpty) {
//                                         Globals.instance.startTimer(setState: reset());
//                                         Globals.instance.start();
//                                         setState(() {
//                                           Globals.instance.isRecording = false;
//                                         });
//                                       }
//                                     },
//                                     child: Container(
//                                       height: 40,
//                                       width: 80,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: const Color(0xffBE3144),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: const Text(
//                                         'Save',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           decoration: TextDecoration.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   Globals.instance.stop();
//                   Globals.instance.timer?.cancel();
//                   setState(() {
//                     Globals.instance.isRecording = true;
//                     Globals.instance.time = 0;
//                   });
//                 }
//               },
//               child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color(0xffBE3144),
//                       spreadRadius: 5,
//                       blurRadius: 10,
//                       offset: Offset(3, 3),
//                     ),
//                     BoxShadow(
//                       color: Colors.white,
//                       spreadRadius: 5,
//                       blurRadius: 10,
//                       offset: Offset(-3, -3),
//                     ),
//                   ],
//                 ),
//                 child: const CircleAvatar(
//                   radius: 70,
//                   backgroundColor: Color(0xff22092C),
//                   child:
//                       Icon(Icons.mic_rounded, size: 100, color: Colors.white),
//                 ),
//               ),
//             ),
//             micButton(
//               context: context,
//               reset: () {
//                 setState(() {});
//               },
//             ),
            GestureDetector(
              onTap: () {
                if (Globals.instance.isRecording) {
                  showDialog(
                    context: context,
                    builder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xff22092C),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffBE3144),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(-2, -2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
//File Name
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: 50,
                                color: const Color(0xff22092C),
                                child: Material(
                                  child: TextField(
                                    controller: Globals.instance.controller,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      isDense: true,
                                      fillColor: const Color(0xff22092C),
                                      // border: OutlineInputBorder(),
                                      contentPadding: const EdgeInsets.all(12),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
//Cancel Button
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffBE3144),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
//Save Button
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      if (Globals.instance.controller.text
                                          .isNotEmpty) {
                                        Globals.instance.visible = true;
                                        startTimer();
                                        start();
                                        // Globals.instance.isRecording = false;
                                        Globals.instance.isRecording = false;
                                        reset();
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffBE3144),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Save',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  stop();
                  Globals.instance.timer?.cancel();
                  Globals.instance.isRecording = true;
                  Globals.instance.visible = false;
                  Globals.instance.time = 0;
                  reset();
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffBE3144),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(-3, -3),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xff22092C),
                  child:
                      Icon(Icons.mic_rounded, size: 100, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
//Timer
            Text(
              formatTime(seconds: Globals.instance.time),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffBE3144),
              ),
            ),
            const SizedBox(height: 100),
            Visibility(
              visible: Globals.instance.visible,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      6,
                      (index) {
                        int i = (anicontroller.value * 6).floor();
                        return AnimatedBuilder(
                          animation: anicontroller.view,
                          builder: (BuildContext context, animation) {
                            return AnimatedContainer(
                              duration: Duration.zero,
                              curve: Curves.bounceInOut,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              constraints: BoxConstraints(
                                minHeight: i == index ? 40 : 20,
                                minWidth: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: const Color(0xffBE3144),
                                borderRadius: BorderRadius.circular(35),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
