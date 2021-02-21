import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/models/space_news_model.dart';

abstract class SpaceNewsEvent extends Equatable {
  const SpaceNewsEvent();
}

class SpaceNewsRequest extends SpaceNewsEvent {
  const SpaceNewsRequest({@required this.page, @required this.spaceNews}) : assert(page != null);

  final int page;
  final List<SpaceNews> spaceNews;

  @override
  List<Object> get props => <Object>[page];
}
