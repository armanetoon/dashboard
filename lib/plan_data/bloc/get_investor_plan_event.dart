part of 'get_investor_plan_bloc.dart';

@immutable
sealed class GetInvestorPlanEvent {}

class GetInvestorPlanClicked extends GetInvestorPlanEvent{
  final String number;

  GetInvestorPlanClicked({required this.number});
}