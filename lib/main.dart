import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/models/album_model_provider.dart';
import 'package:spotify/models/music_model_provider.dart';
import 'package:spotify/view/get_started/get_started_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//
//
// ContentView.Flutter
// Spotify
//
// Welcome & Login screen
//
// Created by: Faiz Rhm

// Mark: Github
// Faiz Rhm
// https://github.com/Faiz-rhm

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlbumModelProvider()),
        ChangeNotifierProvider(create: (context) => MusicModelProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spotify',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.red,
        ),
        home: const GetStartedPage(),
      ),
    );
  }
}
