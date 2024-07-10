part of 'add_update_delete_bloc.dart';
 abstract class AddUpdateDeleteEvent extends Equatable{
   const AddUpdateDeleteEvent();
   @override
  List<Object> get props => [] ;
 }

 class AddPostEvent extends AddUpdateDeleteEvent{
   final Post post;

   const AddPostEvent({required this.post});

   @override
   List<Object> get props => [post] ;
 }

class UpdatePostEvent extends AddUpdateDeleteEvent{
  final Post post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post] ;
}
class DeletePostEvent extends AddUpdateDeleteEvent{
  final int postID;

   const DeletePostEvent({required this.postID});

  @override
  List<Object> get props => [postID] ;
}