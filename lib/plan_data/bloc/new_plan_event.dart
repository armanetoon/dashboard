part of 'new_plan_bloc.dart';

@immutable
sealed class NewPlanEvent {}

class CreatePlanClicked extends NewPlanEvent{
    final PlanDTO plan;

  CreatePlanClicked({required this.plan});
}

class AddImageClicked extends NewPlanEvent{
  final FormData formData;

  AddImageClicked({required this.formData});
}

