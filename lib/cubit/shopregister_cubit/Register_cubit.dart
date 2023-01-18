import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Registermodel/Registermodel.dart';
import '../../models/loginmodel/loginmodel.dart';
import '../../services/login_services.dart';
import '../../services/register_services.dart';

part 'Register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegistercubitInitial());

  RegisterModel? registermodel;

  void Postdata(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(Registercubitloading());
    try {
      registermodel = await RegisterServices.postdata(
          name: name, email: email, phone: phone, password: password);
      emit(Registercubitsucsess());
      print(registermodel!.message);
    } catch (e) {
      print(e.toString());
      emit(Registercubiterror());
    }
  }
}
