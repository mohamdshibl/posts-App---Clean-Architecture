

import 'package:flutter/material.dart';



class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: _buildAppbar(),
      body:Center(child: Text('posts'))
    );
  //     _buildBody(),
  //     floatingActionButton: _buildFloatingBtn(context),
  //   );
  // }

  // AppBar _buildAppbar() => AppBar(title: Text('Posts'));
  //
  // Widget _buildBody() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: BlocBuilder<PostsBloc, PostsState>(
  //       builder: (context, state) {
  //         if (state is LoadingPostsState) {
  //           return LoadingWidget();
  //         } else if (state is LoadedPostsState) {
  //           return RefreshIndicator(
  //               onRefresh: () => _onRefresh(context),
  //               child: PostListWidget(posts: state.posts));
  //         } else if (state is ErrorPostsState) {
  //           return MessageDisplayWidget(message: state.message);
  //         }
  //         return LoadingWidget();
  //       },
  //     ),
  //   );
  // }

  // Future<void> _onRefresh(BuildContext context) async {
  //   BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  // }

//   Widget _buildFloatingBtn(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (_) => PostAddUpdatePage(
//                   isUpdatePost: false,
//                 )));
//       },
//       child: Icon(Icons.add),
//     );
//   }
 }}
