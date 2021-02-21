import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_example/src/bloc/space_news/event.dart';
import 'package:flutter_bloc_example/src/bloc/space_news/state.dart';
import 'package:flutter_bloc_example/src/models/space_news_model.dart';
import 'package:flutter_bloc_example/src/repository/space_news_repository.dart';

class SpaceNewsBloc extends Bloc<SpaceNewsEvent, SpaceNewsState> {
  SpaceNewsBloc(this.spaceNewsRepository)
      : assert(spaceNewsRepository != null),
        super(SpaceNewsInitial());

  final SpaceNewsRepository spaceNewsRepository;

  @override
  Stream<SpaceNewsState> mapEventToState(SpaceNewsEvent event) async* {
    if (event is SpaceNewsRequest) {
      yield SpaceNewsProgress();
      try {
        final List<SpaceNews> spaceNews = await spaceNewsRepository.getNews(event.page);
        if (event.page == 0) {
          yield SpaceNewsSuccess(spaceNews: spaceNews, page: event.page + 1);
        } else {
          if (event.spaceNews.isNotEmpty) {
            event.spaceNews.addAll(spaceNews);
            yield SpaceNewsSuccess(spaceNews: event.spaceNews, page: event.page + 1);
          }
        }
      } catch (err) {
        yield SpaceNewsFailure();
      }
    }
  }
}
