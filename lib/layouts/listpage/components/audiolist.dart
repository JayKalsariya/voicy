import 'package:voice_recorder_2/utils/headers.dart';

class AudioList extends StatefulWidget {
  const AudioList({super.key, required this.item});

  final SongModel item;

  @override
  State<AudioList> createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlay = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.voiceChange);
      },
      title: Text(widget.item.title),
      subtitle: Text(
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
      trailing: GestureDetector(
        onTap: () {
          if (!_isPlay) {
            _player.setAudioSource(AudioSource.file(widget.item.data));
            _player.play();
          } else {
            _player.stop();
          }
          setState(() {
            _isPlay = !_isPlay;
          });
        },
        onLongPress: () {
          _player.setAudioSource(AudioSource.file(widget.item.data));
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
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
          child: CircleAvatar(
            backgroundColor: const Color(0xff22092C),
            // width: 50,
            // height: 50,

            // decoration: BoxDecoration(
            //   gradient: const LinearGradient(
            //     colors: [
            //       Color.fromARGB(255, 46, 96, 248),
            //       Color.fromARGB(255, 211, 51, 255),
            //     ],
            //     begin: FractionalOffset(0.0, 1.0),
            //     end: FractionalOffset(0.0, 0.0),
            //     stops: [0.0, 1.0],
            //     tileMode: TileMode.clamp,
            //   ),
            //   borderRadius: BorderRadius.circular(30),
            // ),
            // padding: const EdgeInsets.all(10.0),
            child: _isPlay
                ? const Icon(
                    Icons.pause,
                    color: Color(0xffBE3144),
                  )
                : const Icon(
                    Icons.play_arrow,
                    color: Color(0xffBE3144),
                  ),
          ),
        ),
      ),
    );
  }
}
