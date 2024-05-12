import 'package:flutter/cupertino.dart';
import 'package:voice_recorder_2/utils/headers.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordings'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<SongModel>>(
          future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true,
          ),
          builder: (context, item) {
            // if (item.data != null) return CircularProgressIndicator();
            // if (item.data!.isEmpty) return const Text('No Audio Found');
            final data = item.data
                    ?.where((item) => item.fileExtension == 'm4a')
                    .toList() ??
                [];
            return Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return AudioList(item: data[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
