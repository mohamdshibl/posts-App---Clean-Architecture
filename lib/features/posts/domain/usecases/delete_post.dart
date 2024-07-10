import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/post_repository.dart';

class DeletePostUseCase {

  final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failures,Unit>> call(int postId) async {
    return await repository.deletePost(postId) ;
  }

}