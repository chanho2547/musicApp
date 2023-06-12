import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/models/music_model.dart';

class MusicModelProvider with ChangeNotifier {
  List<MusicModel> _musics = [];

  List<MusicModel> get musics => _musics;

  //MusicModelProvider ({required List<MusicModel> Musics}) : _Musics = Musics;

  set musics(List<MusicModel> musics) {
    _musics = musics;
    notifyListeners();
  }

  void addMusic(MusicModel music) {
    _musics.add(music);
    notifyListeners();
  }

  void removeMusic(MusicModel music) {
    _musics.remove(music);
    notifyListeners();
  }

  Future<List<MusicModel>> getMusics() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Music').get();
    _musics =
        querySnapshot.docs.map((doc) => MusicModel.fromFirestore(doc)).toList();
    return _musics;
  }
}
