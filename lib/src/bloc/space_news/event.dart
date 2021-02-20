import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SpaceNewsEvent extends Equatable {
  const SpaceNewsEvent();
}

class SpaceNewsRequest extends SpaceNewsEvent {
  const SpaceNewsRequest({@required this.page}) : assert(page != null);

  final int page;

  @override
  List<Object> get props => <Object>[page];
}
