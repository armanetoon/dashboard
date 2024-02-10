part of 'delete_plan_bloc.dart';

@immutable
sealed class DeletePlanState {}

final class DeletePlanInitial extends DeletePlanState {}

final class DeletePlanLoading extends DeletePlanState{}

final class DeletePlanFailure extends DeletePlanState{
final String message;

DeletePlanFailure({required this.message});
}

final class DeletePlanSuccess extends DeletePlanState{}
