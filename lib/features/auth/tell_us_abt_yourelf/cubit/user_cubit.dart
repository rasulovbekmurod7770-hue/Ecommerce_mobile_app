import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/user_dto.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  
  Future<void> getDetails( int userId, UserDto user) async {
    emit( UserLoading());
    try {
      await AuthRepo().getDetails(userId, user);
      emit(UserSuccess("succes"));
      print("all good");
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
