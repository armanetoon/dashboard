part of 'update_user_bloc.dart';

@immutable
sealed class UpdateUserEvent {}

class UpdateUserClicked extends UpdateUserEvent{
  final Map<String,dynamic> changes;

  UpdateUserClicked({required this.changes});
}
