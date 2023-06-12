import 'package:flutter/material.dart';
import 'package:spotify/models/album_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumModelProvider with ChangeNotifier {
  List<AlbumModel> _albums = [];

  List<AlbumModel> get albums => _albums;

  //AlbumModelProvider ({required List<AlbumModel> albums}) : _albums = albums;

  set albums(List<AlbumModel> albums) {
    _albums = albums;
    notifyListeners();
  }

  void addAlbum(AlbumModel album) {
    _albums.add(album);
    notifyListeners();
  }

  void removeAlbum(AlbumModel album) {
    _albums.remove(album);
    notifyListeners();
  }

  Future<List<AlbumModel>> getAlbums() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Album').get();
    _albums =
        querySnapshot.docs.map((doc) => AlbumModel.fromFirestore(doc)).toList();
    return _albums;
  }
}
