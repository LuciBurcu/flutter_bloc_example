import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/src/bloc/space_news/bloc.dart';
import 'package:flutter_bloc_example/src/bloc/space_news/event.dart';
import 'package:flutter_bloc_example/src/bloc/space_news/state.dart';
import 'package:flutter_bloc_example/src/models/space_news_model.dart';
import 'package:flutter_bloc_example/src/widgets/card_space.dart';

class MainScreen extends StatelessWidget {
  Widget _renderMobile(BuildContext context, SpaceNewsState state) {
    if (state is SpaceNewsInitial) {
      BlocProvider.of<SpaceNewsBloc>(context).add(
         const SpaceNewsRequest(page: 0),
      );
    }
    if (state is SpaceNewsProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is SpaceNewsSuccess) {
      final List<SpaceNews> spaceNews = state.spaceNews;
      return Center(
        child: ListView.builder(
          itemCount: spaceNews.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == spaceNews.length) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  onPressed: (){
                    BlocProvider.of<SpaceNewsBloc>(context).add(SpaceNewsRequest(page: state.page, spaceNews: state.spaceNews));
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Load more'),
                ),
              );
            }
            return CardSpace(
              imageUrl: spaceNews[index].imageUrl,
              title: spaceNews[index].title,
              summary: spaceNews[index].summary,
              publishedAt: spaceNews[index].publishedAt,
            );
          },
        ),
      );
    }
    if (state is SpaceNewsFailure) {
      return const Center(
        child: Text('Aw snap...'),
      );
    }
    return const Center(
      child: Text('Hello'),
    );
  }

  Widget _renderWeb(BuildContext context, SpaceNewsState state) {
    if (state is SpaceNewsInitial) {
      BlocProvider.of<SpaceNewsBloc>(context).add(
        const SpaceNewsRequest(page: 0),
      );
    }
    if (state is SpaceNewsProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is SpaceNewsSuccess) {
      final List<SpaceNews> spaceNews = state.spaceNews;
      return Container(
        width: 1000,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                // child: ListWheelScrollView(
                //   children: spaceNews
                //       .map((SpaceNews e) => CardSpace(
                //             title: e.title,
                //             imageUrl: e.imageUrl,
                //             publishedAt: e.publishedAt,
                //             summary: e.summary,
                //           ))
                //       .toList(),
                //   itemExtent: 400,
                // ),
                child: ListView.builder(
                  itemCount: spaceNews.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == spaceNews.length) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MaterialButton(
                          onPressed: (){
                            BlocProvider.of<SpaceNewsBloc>(context).add(SpaceNewsRequest(page: state.page, spaceNews: state.spaceNews));
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text('Load more'),
                        ),
                      );
                    }
                    return CardSpace(
                      imageUrl: spaceNews[index].imageUrl,
                      title: spaceNews[index].title,
                      summary: spaceNews[index].summary,
                      publishedAt: spaceNews[index].publishedAt,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (state is SpaceNewsFailure) {
      return const Center(
        child: Text('Aw snap...'),
      );
    }
    return const Center(
      child: Text('Hello'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: const Text('Bloc Sample App')) : null,
      body: Center(
        child: BlocBuilder<SpaceNewsBloc, SpaceNewsState>(
          builder: (BuildContext context, SpaceNewsState state) {
            if (kIsWeb) {
              return _renderWeb(context, state);
            } else {
              return _renderMobile(context, state);
            }
          },
        ),
      ),
    );
  }
}
