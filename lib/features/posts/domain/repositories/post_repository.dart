import '../../../../core/error/failures.dart';
import '../entities/posts.dart';
import 'package:dartz/dartz.dart';

    abstract class PostsRepository {

         Future<Either<Failures,List<Post>>> getAllPosts();
         Future<Either<Failures,Unit>>deletePost(int id);
         Future<Either<Failures,Unit>>updatePost(Post post);
         Future<Either<Failures,Unit>>addPost(Post post);

}