part of 'update_user_bloc.dart';

@immutable
sealed class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserLoading extends UpdateUserState{}

final class UpdateUserFailure extends UpdateUserState{
  final String message;

  UpdateUserFailure({required this.message});
}

final class UpdateUserSuccess extends UpdateUserState{}