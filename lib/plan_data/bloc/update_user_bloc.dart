import 'package:bloc/bloc.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:meta/meta.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final IPlanRepository planRepository;
  UpdateUserBloc(this.planRepository) : super(UpdateUserInitial()) {
    on<UpdateUserEvent>((event, emit) async{
      if(event is UpdateUserClicked){
        try{
          emit(UpdateUserLoading());
          await planRepository.updatePlan(event.changes);
          emit(UpdateUserSuccess());
        } on UpdateUserNotFoundExc catch(_){
          emit(UpdateUserFailure(message: _.message));
        } on UpdateUserFailureExc catch(_){
          emit(UpdateUserFailure(message: _.message));
        }
      }
    });
  }
}
