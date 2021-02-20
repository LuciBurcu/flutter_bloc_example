import 'package:equatable/equatable.dart';

class SpaceNews extends Equatable {
  const SpaceNews({this.id, this.title, this.imageUrl, this.newsSite, this.summary, this.publishedAt});

  final String id;

  final String title;

  final String imageUrl;

  final String newsSite;

  final String summary;

  final String publishedAt;

  @override
  List<Object> get props => <Object>[id, title, imageUrl, newsSite, summary, publishedAt];

  static SpaceNews fromJson(dynamic json) {
    return SpaceNews(
      id: json['weather'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: json['publishedAt'],
    );
  }
}
