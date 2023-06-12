import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/music_model.dart';
import 'package:spotify/models/music_model_provider.dart';

class MusicDetailScreen extends StatelessWidget {
  const MusicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicModelProvider>(context);
    return FutureBuilder(
      future: musicProvider.getMusics(),
      builder:
          (BuildContext context, AsyncSnapshot<List<MusicModel>> snapshot) {
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
          // print(
          //     "snapshot.data!.map: ${snapshot.data!.map((album) => Text(album.title)).toList()}");
          // 데이터가 준비된 경우
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Music Detail'),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Center(
                child: ListView(
                  children: snapshot.data!
                      .map((album) => Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.0, 1.0),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Text("lyrics",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        album.lyrics,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          "Artist: ${album.artist.substring(0)}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text("Album: ${album.title.substring(0)}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      // const SizedBox(
                                      //   height: 20,
                                      // ),
                                      // Text("Genre: ${album.genre.substring(0)}",
                                      //     style: const TextStyle(
                                      //         fontSize: 25,
                                      //         fontWeight: FontWeight.bold,
                                      //         color: Colors.black)),
                                      const SizedBox(height: 20),
                                      Text(
                                          "PlayTime: ${album.playTime.substring(0)}",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
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
