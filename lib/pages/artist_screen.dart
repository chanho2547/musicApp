import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/album_model.dart';
import 'package:spotify/models/album_model_provider.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
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
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Artist'),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView(
                children: snapshot.data!
                    .map((album) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.pink,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                album.artist,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
