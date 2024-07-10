part of 'add_update_delete_bloc.dart';


abstract class AddUpdateDeleteState extends Equatable {}

final class AddUpdateDeleteInitial extends AddUpdateDeleteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class LoadingAddUpdateDeletePostState extends AddUpdateDeleteState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
final class ErrorAddUpdateDeletePostState extends AddUpdateDeleteState {
  final String message;
  ErrorAddUpdateDeletePostState({required this.message});

  @override
  List<Object?> get props => [message];
}
final class MessageAddUpdateDeletePostState extends AddUpdateDeleteState {
  final String message;
  MessageAddUpdateDeletePostState({required this.message});

  @override
  List<Object?> get props {
    return [message];
  }
}
