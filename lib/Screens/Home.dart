import 'package:apiintegration/Bloc/PostsAddBloc/bloc/addpost_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final titlecontroller = TextEditingController();
  final bodycontroller = TextEditingController();

  AddpostBloc addpostBloc = AddpostBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Posts')),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                hintText: 'Title',
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: bodycontroller,
                maxLines: 50,
                decoration: InputDecoration(
                  hintText: 'Content',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          BlocListener<AddpostBloc, AddpostState>(
            bloc: addpostBloc,
            listener: (context, state) {
              if (state is PostaddedModelState) {
                addpostBloc.add(AddPostButtonclickedevent(post: state.model));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    final _title = titlecontroller.text;
                    final _body = bodycontroller.text;
                    final userId =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    addpostBloc.add(AddPostButtonclickedModelEvent(
                        title: _title, body: _body, id: userId));
                  },
                  child: Text("Add Post")),
            ),
          )
        ],
      )),
    );
  }

  /*  Future<void> AddButtonClicked(BuildContext context) async {
    final title = titlecontroller.text;
    final body = bodycontroller.text;
    final newPost = PostModel(
        title: title,
        body: body,
        userId: DateTime.now().millisecondsSinceEpoch.toString());
  } */
}
