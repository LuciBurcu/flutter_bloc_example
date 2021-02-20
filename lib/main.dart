import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/bloc_observer.dart';
import 'package:flutter_bloc_example/src/data/space_news_api.dart';
import 'package:flutter_bloc_example/src/index.dart';
import 'package:flutter_bloc_example/src/repository/space_news_repository.dart';
import 'package:http/http.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  final SpaceNewsRepository spaceNewsRepository = SpaceNewsRepository(
    spaceNewsAPI: SpaceNewsAPI(
      client: Client(),
    ),
  );
  runApp(BlocApp(
    spaceNewsRepository: spaceNewsRepository,
  ));
}
