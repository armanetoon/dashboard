part of 'new_plan_bloc.dart';

@immutable
sealed class NewPlanEvent {}

class CreatePlanClicked extends NewPlanEvent{
    final PlanDTO plan;
    /*final File imageFile;*/

  CreatePlanClicked({required this.plan});

  //CreatePlanClicked({, required this.imageFile});
}

class AddImageClicked extends NewPlanEvent{
  final FormData formData;

  AddImageClicked({required this.formData});
}