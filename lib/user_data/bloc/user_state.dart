part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class GetAllUserLoading extends UserState{}

final class GetAllUserFailure extends UserState{
  final String message;

  GetAllUserFailure({required this.message});
}

final class GetAllUserSuccess extends UserState{
  final List<UserDTO> users;

  GetAllUserSuccess({required this.users});
}

final class GetAllPlanNotFound extends UserState{
  final String message;

  GetAllPlanNotFound({required this.message});
}