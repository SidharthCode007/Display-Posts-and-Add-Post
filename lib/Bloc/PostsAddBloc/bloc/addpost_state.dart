part of 'addpost_bloc.dart';

@immutable
abstract class AddpostState {}

abstract class AddpostActionState implements AddpostState {}

final class AddpostInitial extends AddpostState {}

class PostaddedSuccessfullyState extends AddpostActionState {}

class PostaddedErrorState extends AddpostActionState {}

class PostaddedModelState extends AddpostActionState {
  final PostModel model;

  PostaddedModelState({required this.model});
}
