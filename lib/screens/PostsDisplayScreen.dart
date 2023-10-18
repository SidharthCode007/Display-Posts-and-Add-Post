import 'package:apiintegration/Bloc/bloc/posts_bloc.dart';
import 'package:apiintegration/screens/PostsAddScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      bloc: postsBloc,
      listenWhen: (previous, current) => current is PostsActionState,
      buildWhen: (previous, current) => current is! PostsActionState,
      listener: (context, state) {
        if (state is FloatingButtonClickedActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostsFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PostFetchingSuccessfulState:
            final successState = state as PostFetchingSuccessfulState;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Posts Page'),
                ),
                floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      postsBloc.add(FloatingButtonClickedevent());
                    }),
                body: Container(
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              successState.posts[index].title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(successState.posts[index].body)
                          ],
                        ),
                      );
                    },
                  ),
                ));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
