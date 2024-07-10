import 'package:cm1/core/error/exeption.dart';
import 'package:cm1/core/error/failures.dart';
import 'package:cm1/core/network/network_info.dart';
import 'package:cm1/features/posts/data/models/post_model.dart';

import 'package:cm1/features/posts/domain/entities/posts.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo}
      );

  @override
  Future<Either<Failures, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyFailure());
      }
    }
  }

  @override
  Future<Either<Failures, Unit>> addPost(Post post) async{

    final PostModel postModel= PostModel(id:post.id,title: post.title,body:post.body,);
    if (await networkInfo.isConnected){
      try{
       await remoteDataSource.addPost(postModel);
          return const Right(unit);
      }on ServerFailure{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> updatePost(Post post) async{
    final PostModel postModel= PostModel(id:post.id,title: post.title,body:post.body,);
    if (await networkInfo.isConnected){
      try{
        await remoteDataSource.updatePost(postModel);
        return const Right(unit);
      }on ServerFailure{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }



  @override
  Future<Either<Failures, Unit>> deletePost(postId) async{
    if (await networkInfo.isConnected){
      try{
        await remoteDataSource.deletePost(postId);
        return const Right(unit);
      }on ServerFailure{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }
//   Future<Either<Failures, Unit>> getMessage(
//     Future<Unit> Function() addOrUpdateOrDeletePost() async{
//       if (await networkInfo.isConnected){
//         try{
//          // await remoteDataSource.deletePost(postId);
//           return  Right(unit);
//         }on ServerFailure{
//           return Left(ServerFailure());
//         }
//       }else{
//         return Left(OfflineFailure());
//       }
//     }
//   )
// }

}
