import 'package:bloc/bloc.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:meta/meta.dart';

part 'get_investor_plan_event.dart';
part 'get_investor_plan_state.dart';

class GetInvestorPlanBloc extends Bloc<GetInvestorPlanEvent, GetInvestorPlanState> {
  final IPlanRepository planRepository;
  GetInvestorPlanBloc(this.planRepository) : super(GetInvestorPlanInitial()) {
    on<GetInvestorPlanEvent>((event, emit)async {
      if(event is GetInvestorPlanClicked){
        try{
          emit(GetInvestorPlanLoading());
          final res = await planRepository.getInvestorPlan(event.number);
          emit(GetInvestorPlanSuccess(plans: res));
        }on GetInvestorPlanNotFoundExc catch (_){
          print("++");
          emit(GetInvestorPlanFailed(message: _.message));
        }on GetInvestorPlanExc catch (_){
          print("--");
          emit(GetInvestorPlanFailed(message: _.message));
        }
        print("**");
      }
    });
  }
}
