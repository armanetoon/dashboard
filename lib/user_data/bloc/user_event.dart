part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetAllUserClicked extends UserEvent{
  final bool normal;

  GetAllUserClicked({required this.normal});
}