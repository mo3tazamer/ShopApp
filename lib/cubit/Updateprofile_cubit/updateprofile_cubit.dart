import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/loginmodel/loginmodel.dart';
import '../../services/login_services.dart';
import '../../services/updateprofile_services.dart';

part 'updateprofile_state.dart';

class UpdateProfileCubit extends Cubit<updateprofilecubitState> {
  UpdateProfileCubit() : super(updateprofilecubitInitial());

  LogInModel? loginmodel;

  void putdata(
      {required String name,
      required String email,
      required String phone}) async {
    emit(updateprofilecubitloading());
    try {
      loginmodel = await UpdateProFileServices.putdata(
          name: name, email: email, phone: phone);
      emit(updateprofilecubitsucsess());
      print(loginmodel!.message);
    } catch (e) {
      print(e.toString());
      emit(updateprofilecubiterror());
    }
  }
}
