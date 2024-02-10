import 'package:bloc/bloc.dart';
import 'package:dashboard/exception.dart';
import 'package:dashboard/user_data/repository/user_repo.dart';
import 'package:dashboard/user_data/userDTO.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UserEvent>((event, emit) async{
      if(event is GetAllUserClicked){
        try{
          emit(GetAllUserLoading());
          final result = await userRepository.getAllUser(event.normal);
          if (result.isEmpty){
            throw GetAllUserNotFoundExc();
          }
          emit(GetAllUserSuccess(users: result));
        } on GetAllUserNotFoundExc catch(_){
          emit(GetAllPlanNotFound(message: _.message));
        }catch(_){
          emit(GetAllUserFailure(message: "دریافت لیست کاربران با مشکل مواجه شد"));
        }
      }
    });
  }
}
