import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/space_news/bloc.dart';

import 'package:flutter_bloc_example/src/repository/space_news_repository.dart';
import 'package:flutter_bloc_example/src/widgets/main_screen.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key key, @required this.spaceNewsRepository})
      : assert(spaceNewsRepository != null),
        super(key: key);

  final SpaceNewsRepository spaceNewsRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => BlocProvider<SpaceNewsBloc>(
              create: (BuildContext context) => SpaceNewsBloc(spaceNewsRepository),
              child: MainScreen(),
            ),
      },
    );
  }
}
