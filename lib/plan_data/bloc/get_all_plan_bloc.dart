import 'package:bloc/bloc.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_plan_event.dart';
part 'get_all_plan_state.dart';

class GetAllPlanBloc extends Bloc<GetAllPlanEvent, GetAllPlanState> {
  final IPlanRepository planRepository;
  GetAllPlanBloc(this.planRepository) : super(GetAllPlanLoading()) {
    on<GetAllPlanEvent>((event, emit) async{
      if(event is GetAllPlanClicked){
        try {
          emit(GetAllPlanLoading());
          final result = await planRepository.getAllPlan();
          if(result.isEmpty){
            throw GetAllPlansNotFoundException();
          }
          emit(GetAllPlanSuccess(plans: result));
        } on GetAllPlansNotFoundException catch (_){
          emit(GetAllPlanNotFound(message: _.message));
        }catch(_){
          emit(GetAllPlanFailure(message: "نمایش طرح ها با مشکل رو به رو شده است"));
        }
      }
    });
  }
}
