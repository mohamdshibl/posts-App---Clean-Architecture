import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exeption.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> deletePost(int postId);

 // Future<Unit> allPosts(List<PostModel> postModels);
}

const baseUrl = 'https://jsonplaceholder.typicode.com';

class PostLocalDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostLocalDataSourceImpl({required this.client});

  // @override
  // Future<Unit> allPosts(List<PostModel> postModels) {
  //   // TODO: implement AllPosts
  //   throw UnimplementedError();
  // }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse('$baseUrl/posts/'), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    final response =
        await client.post(Uri.parse("$baseUrl/posts/"), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id;
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    final response =
        await client.patch(Uri.parse("$baseUrl/posts/$postId"), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse("$baseUrl/posts/${postId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
