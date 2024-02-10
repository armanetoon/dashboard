import 'package:bloc/bloc.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:meta/meta.dart';

part 'delete_plan_event.dart';
part 'delete_plan_state.dart';

class DeletePlanBloc extends Bloc<DeletePlanEvent, DeletePlanState> {
  final IPlanRepository planRepository;
  DeletePlanBloc(this.planRepository) : super(DeletePlanInitial()) {
    on<DeletePlanEvent>((event, emit) async{
      if (event is DeletePlanClicked){
        try{
          emit(DeletePlanLoading());
          await planRepository.deletePlan(event.plan);
          emit(DeletePlanSuccess());
        }on DeletePlanExc catch (_){
          emit(DeletePlanFailure(message: _.message));
        }
      }
    });
  }
}
