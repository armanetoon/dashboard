part of 'delete_plan_bloc.dart';

@immutable
sealed class DeletePlanEvent {}

class DeletePlanClicked extends DeletePlanEvent{
  final PlanDTO plan;

  DeletePlanClicked({required this.plan});
}