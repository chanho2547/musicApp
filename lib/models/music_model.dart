import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel {
  final String title;
  final String lyrics;
  final int releaseDate;
  final String artist;
  final String album;
  final String genre;
  //final int playCount;
  final String playTime;

  MusicModel({
    required this.title,
    required this.lyrics,
    required this.releaseDate,
    required this.artist,
    required this.album,
    required this.genre,
    //required this.playCount,
    required this.playTime,
  });

  factory MusicModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MusicModel(
      title: data['제목'],
      lyrics: data['가사'] ?? '가사가 없습니다.',
      releaseDate: data['발매일'] ?? 0,
      artist: data['아티스트'].toString(),
      album: data['앨범'].toString(),
      genre: data['장르'].toString(),
      //playCount: data['재생수'],
      playTime: data['재생시간'] ?? '0',
    );
  }
}
