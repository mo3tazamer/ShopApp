import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/models/homemodel/homemodel.dart';

import '../../models/changefavoritemodel/changefavoritemodel.dart';
import '../../services/favorite_services.dart';
import '../../services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeModel? homemodel;
  ChangeFavoriteModel? changeFavoriteModel;

  void gethomedata() async {
    emit(Homeloading());
    try {
      homemodel = await HomeServices.getdata();
      emit(Homesucsess());
    } catch (e) {
      emit(Homeerror());
      print(e.toString());
    }
  }

  void changefavoritedata({required int id}) async {
    try {
      changeFavoriteModel =
          await ChangeFavoritesServices.postdata(productid: id);
      print(changeFavoriteModel!.message);
      gethomedata();
      emit(changefavoritesucsess());
    } catch (e) {
      emit(changefavoriteerror());
      print(e.toString());
    }
  }

  void refrshhomedata() async {
    try {
      homemodel = await HomeServices.getdata();
      emit(Homesucsess());
    } catch (e) {
      emit(Homeerror());
      print(e.toString());
    }
  }
}
