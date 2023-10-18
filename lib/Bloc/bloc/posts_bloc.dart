import 'dart:async';

import 'package:apiintegration/Model/post_data_model.dart';
import 'package:apiintegration/Repo/Posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<FloatingButtonClickedevent>(floatingButtonClickedevent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> floatingButtonClickedevent(
      FloatingButtonClickedevent event, Emitter<PostsState> emit) {
    emit(FloatingButtonClickedActionState());
  }
}
