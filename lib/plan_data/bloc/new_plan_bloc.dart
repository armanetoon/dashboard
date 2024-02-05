import 'dart:html';
import 'package:dio/dio.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_plan_event.dart';

part 'new_plan_state.dart';

class NewPlanBloc extends Bloc<NewPlanEvent, NewPlanState> {
  final IPlanRepository planRepository;

  NewPlanBloc(this.planRepository) : super(NewPlanInitial()) {
    on<NewPlanEvent>((event, emit) async {
      if (event is CreatePlanClicked) {
        try {
          emit(NewPlanLoading());
          await planRepository.createPlan(event.plan);
          emit(NewPlanSuccess(message: "طرح با موفقیت ثبت شد"));
        } on NewPlanFailureExc catch (_) {
          emit(NewPlanFailure(message: _.message));
        }
      }
      if (event is AddImageClicked) {
        try {
          emit(GetImageLoading());
          final result = await planRepository.getImage(event.formData);
          emit(GetImageSuccess(image: result));
        } on GetImageFailureExc catch (_) {
          emit(GetImageFailure(message: "آپلود عکس با مشکل مواجه شد"));
        }
      }
    });
  }
}
