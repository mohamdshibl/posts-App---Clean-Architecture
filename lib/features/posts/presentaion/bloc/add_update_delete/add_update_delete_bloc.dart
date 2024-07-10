import 'package:bloc/bloc.dart';
import 'package:cm1/core/strings/message.dart';
import 'package:cm1/features/posts/domain/usecases/add_post.dart';
import 'package:cm1/features/posts/domain/usecases/delete_post.dart';
import 'package:cm1/features/posts/domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/posts.dart';

part 'add_update_delete_event.dart';
part 'add_update_delete_state.dart';

class AddUpdateDeleteBloc extends Bloc<AddUpdateDeleteEvent, AddUpdateDeleteState> {
  final AddPostUseCase addPost;
  final UpdatePostsUseCase updatePost;
  final DeletePostUseCase deletePost;
  AddUpdateDeleteBloc(this.updatePost, this.deletePost, {required this.addPost}): super(AddUpdateDeleteInitial()) {
    on<AddUpdateDeleteEvent>((event, emit) async {

        if (event is AddPostEvent){
            emit(LoadingAddUpdateDeletePostState());
            final failureOrDoneMessage = await addPost(event.post);
            emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage,ADD_SUCCESS_MESSAGE));

        }else if(event is UpdatePostEvent)
        {
          emit(LoadingAddUpdateDeletePostState());
          final failureOrDoneMessage = await updatePost(event.post);
          emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage,UPDATE_SUCCESS_MESSAGE));
        }
          else if (event is DeletePostEvent)
          {
            emit(LoadingAddUpdateDeletePostState());
            final failureOrDoneMessage = await deletePost(event.postID);
           emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage,DELETE_SUCCESS_MESSAGE));
          }
        });}
  AddUpdateDeleteState _eitherDoneMessageOrErrorState(
      Either<Failures, Unit> either, String message) {
    return either.fold(
          (failure) => ErrorAddUpdateDeletePostState(
        message: _mapFailureToMessage(failure),
      ),
          (_) => MessageAddUpdateDeletePostState(message: message),
    );
  }


  String _mapFailureToMessage(Failures failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
