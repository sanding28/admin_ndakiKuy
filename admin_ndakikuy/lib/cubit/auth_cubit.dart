import 'package:admin_ndakikuy/models/admin_model.dart';
import 'package:admin_ndakikuy/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    required String basecamp,
  }) async{
    try {
      emit(AuthLoading());

      AdminModel user = await AuthService().signUp(
        email: email, 
        password: password, 
        name: name, 
        basecamp: basecamp
      );

      emit(AuthSucess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async{
    try {
      emit(AuthLoading());
      AdminModel user = await AuthService().signIn(
        email: email, 
        password: password,
      );
      emit(AuthSucess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

}
