import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts.dart';
import '../repositories/post_repository.dart';

class AddPostUseCase {

  final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failures,Unit>> call(Post post) async {
    return await repository.addPost(post);
  }

}