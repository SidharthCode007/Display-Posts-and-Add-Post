part of 'addpost_bloc.dart';

@immutable
abstract class AddpostEvent {}

class AddPostButtonclickedevent extends AddpostEvent {
  final PostModel post;

  AddPostButtonclickedevent({required this.post});
}

class AddPostButtonclickedModelEvent extends AddpostEvent {
  final String title;
  final String body;
  final String id;

  AddPostButtonclickedModelEvent(
      {required this.title, required this.body, required this.id});
}
