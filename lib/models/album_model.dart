import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumModel {
  final int releaseDate;
  final List<String> songs;
  final String artist;
  final String genre;
  final int likes;
  final String playTime;
  final String coverImage;
  final String title;

  AlbumModel({
    required this.releaseDate,
    required this.songs,
    required this.artist,
    required this.genre,
    required this.likes,
    required this.playTime,
    required this.coverImage,
    required this.title,
  });

  factory AlbumModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AlbumModel(
      releaseDate: data['발매일'],
      songs: data['수록'] != null ? List<String>.from(data['수록']) : [],
      artist: data['아티스트 정보'],
      genre: data['장르'],
      likes: data['좋아요 수'],
      playTime: data['총 플레이타임'],
      coverImage: data['커버 이미지'],
      title: data['제목'],
    );
  }
}
