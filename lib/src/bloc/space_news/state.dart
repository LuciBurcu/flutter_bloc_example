import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/src/models/space_news_model.dart';

abstract class SpaceNewsState extends Equatable {
  const SpaceNewsState();

  @override
  List<Object> get props => <Object>[];
}

class SpaceNewsInitial extends SpaceNewsState {}

class SpaceNewsProgress extends SpaceNewsState {}

class SpaceNewsSuccess extends SpaceNewsState {
  const SpaceNewsSuccess({@required this.spaceNews}) : assert(spaceNews != null);

  final List<SpaceNews> spaceNews;

  @override
  List<Object> get props => <Object>[spaceNews];
}

class SpaceNewsFailure extends SpaceNewsState {}

