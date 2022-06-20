import 'package:admin_ndakikuy/services/basecamp_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/basecamp_model.dart';

part 'basecamp_state.dart';

class BasecampCubit extends Cubit<BasecampState> {
  BasecampCubit() : super(BasecampInitial());

  void fetchBasecamp()async{
    try{
      emit(BasecampLoading());

      List<BasecampModel> basecamp = await BasecampService().fetchBasecamp();

      emit (BasecampSuccess(basecamp));
    } catch (e) {
      emit(BasecampFailed(e.toString()));
    }
  }
}
