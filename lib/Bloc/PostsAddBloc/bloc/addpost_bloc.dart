import 'dart:async';

import 'package:apiintegration/Model/post_model/post_model.dart';
import 'package:apiintegration/Repo/Posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addpost_event.dart';
part 'addpost_state.dart';

class AddpostBloc extends Bloc<AddpostEvent, AddpostState> {
  AddpostBloc() : super(AddpostInitial()) {
    on<AddPostButtonclickedevent>(addPostButtonclickedevent);
    on<AddPostButtonclickedModelEvent>(addPostButtonclickedModelEvent);
  }

  FutureOr<void> addPostButtonclickedModelEvent(
      AddPostButtonclickedModelEvent event, Emitter<AddpostState> emit) {
    final AddedPost =
        PostModel(title: event.title, body: event.body, userId: event.id);
    emit(PostaddedModelState(model: AddedPost));
  }

  FutureOr<void> addPostButtonclickedevent(
      AddPostButtonclickedevent event, Emitter<AddpostState> emit) async {
    bool ApiResponse = await PostsRepo.addPost(event.post);
    if (ApiResponse == true) {
      emit(PostaddedSuccessfullyState());
    } else {
      emit(PostaddedErrorState());
    }
  }
}
