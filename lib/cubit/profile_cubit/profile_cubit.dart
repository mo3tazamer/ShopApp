import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/models/homemodel/homemodel.dart';

import '../../models/profilemodel/profilemodel.dart';
import '../../services/home_services.dart';
import '../../services/local/profileservices.dart';

part 'profile_state.dart';

class ProFileCubit extends Cubit<ProFileState> {
  ProFileCubit() : super(HomeInitial());

  ProFileModel? profileModel;

  void getProFiledata() async {
    emit(ProFileloading());

    try {
      profileModel = await ProFileServices.getdata();
      emit(ProFilesucsess());
    } catch (e) {
      emit(ProFileerror());
      print(e.toString());
    }
  }
}
