import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/album_model.dart';
import 'package:spotify/models/album_model_provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    // TODO: implement initState

    //final albumProvider = Provider.of<AlbumModelProvider>(context, listen: false);
    //get value from firebase

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final albumProvider = Provider.of<AlbumModelProvider>(context);
    return FutureBuilder(
      future: albumProvider.getAlbums(),
      builder:
          (BuildContext context, AsyncSnapshot<List<AlbumModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Loading....",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ); // 데이터를 기다리는 동안 보여줄 위젯 (로딩 인디케이터)
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // 오류가 발생한 경우에 보여줄 위젯
        } else {
          // print("snapshot.data: ${snapshot.data}");
          // print("snapshot.data!.length: ${snapshot.data!.length}");
          print(
              "snapshot.data!.map: ${snapshot.data!.map((album) => Text(album.title)).toList()}");
          // 데이터가 준비된 경우
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Album'),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Center(
                child: Column(
                  children: snapshot.data!
                      .map((album) => Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              album.title,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
