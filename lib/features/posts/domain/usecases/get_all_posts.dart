import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts.dart';
import '../repositories/post_repository.dart';

class GetAllPostsUseCase {

  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<Failures, List<Post>>> call() async {
    return await repository.getAllPosts() ;
  }

}