part of 'new_plan_bloc.dart';

@immutable
sealed class NewPlanState {}

final class NewPlanInitial extends NewPlanState {}

final class NewPlanLoading extends NewPlanState {}

final class NewPlanSuccess extends NewPlanState {
  final String message;

  NewPlanSuccess({required this.message});
}

final class NewPlanFailure extends NewPlanState{
  final String message;

  NewPlanFailure({required this.message});
}

final class GetImageLoading extends NewPlanState{}

final class GetImageSuccess extends NewPlanState{
  final String image;

  GetImageSuccess({required this.image});
}

final class GetImageFailure extends NewPlanState{
  final String message;

  GetImageFailure({required this.message});
}

