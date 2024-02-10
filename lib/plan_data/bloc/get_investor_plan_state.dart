part of 'get_investor_plan_bloc.dart';

@immutable
sealed class GetInvestorPlanState {}

final class GetInvestorPlanInitial extends GetInvestorPlanState {}

final class GetInvestorPlanLoading extends GetInvestorPlanState{}

final class GetInvestorPlanSuccess extends GetInvestorPlanState{
  final List<PlanDTO> plans;

  GetInvestorPlanSuccess({required this.plans});
}

final class GetInvestorPlanFailed extends GetInvestorPlanState{
  final String message;

  GetInvestorPlanFailed({required this.message});
}
