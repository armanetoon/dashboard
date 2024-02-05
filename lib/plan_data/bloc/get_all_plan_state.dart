part of 'get_all_plan_bloc.dart';

@immutable
sealed class GetAllPlanState {}

final class GetAllPlanInitial extends GetAllPlanState {}

final class GetAllPlanLoading extends GetAllPlanState{}

final class GetAllPlanFailure extends GetAllPlanState{
  final String message;

  GetAllPlanFailure({required this.message});
}

final class GetAllPlanSuccess extends GetAllPlanState{
  final List<PlanDTO> plans;

  GetAllPlanSuccess({required this.plans});
}

final class GetAllPlanNotFound extends GetAllPlanState{
  final String message;

  GetAllPlanNotFound({required this.message});
}
