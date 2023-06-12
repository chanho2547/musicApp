import 'package:flutter/material.dart';
import 'package:spotify/pages/album_screen.dart';
import 'package:spotify/pages/artist_screen.dart';
import 'package:spotify/pages/music_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    //final albumProvider = Provider.of<AlbumModelProvider>(context, listen: false);
    //get value from firebase

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AlbumScreen()));
            },
            child: Container(
              height: 60,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.pink,
              ),
              child: const Center(
                child: Text(
                  "Album",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ArtistScreen()));
            },
            child: Container(
              height: 60,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.pink,
              ),
              child: const Center(
                child: Text(
                  "Artist",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MusicScreen()));
            },
            child: Container(
              height: 60,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.pink,
              ),
              child: const Center(
                child: Text(
                  "Music",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// final String releaseDate;
//   final List<String> songs;
//   final String artist;
//   final String genre;
//   final int likes;
//   final String playTime;
//   final String coverImage;


// SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 54,
//                 ),
//                 WelcomeTitle(
//                   title: 'Good Morning',
//                 ),
//                 SizedBox(
//                   height: 32,
//                 ),
//                 WeeklyTitle(),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 WeeklyMusicList(),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 CustomTitle(title: 'Your Top Mixes'),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 TopMusic(),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 CustomTitle(title: 'Suggested artists'),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Artist()
//               ],
//             ),
//           ),
//         );