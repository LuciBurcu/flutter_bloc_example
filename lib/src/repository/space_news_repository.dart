import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/data/space_news_api.dart';
import 'package:flutter_bloc_example/src/models/space_news_model.dart';

class SpaceNewsRepository {
  const SpaceNewsRepository({@required this.spaceNewsAPI}) : assert(spaceNewsAPI != null);

  final SpaceNewsAPI spaceNewsAPI;

  Future<List<SpaceNews>> getNews(int page) async {
    return spaceNewsAPI.getSpaceNews(page);
  }
}
