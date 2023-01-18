import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/loginmodel/loginmodel.dart';
import '../../services/login_services.dart';

part 'logincubit_state.dart';

class LoginCubit extends Cubit<LogincubitState> {
  LoginCubit() : super(LogincubitInitial());

  LogInModel? loginmodel;

  void Postdata({required String email, required String password}) async {
    emit(Logincubitloading());
    try {
      loginmodel =
          await LoginServices.postdata(email: email, password: password);
      emit(Logincubitsucsess());
      print(loginmodel!.message);
    } catch (e) {
      print(e.toString());
      emit(Logincubiterror());
    }
  }
}
