import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/music_model.dart';
import 'package:spotify/models/music_model_provider.dart';
import 'package:spotify/pages/music_detail_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {
    // TODO: implement initState

    //final albumProvider = Provider.of<AlbumModelProvider>(context, listen: false);
    //get value from firebase

    super.initState();
  }

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
              title: const Text('Music'),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Center(
                child: ListView(
                  children: snapshot.data!
                      .map((album) => Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MusicDetailScreen())),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    album.title,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink),
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
