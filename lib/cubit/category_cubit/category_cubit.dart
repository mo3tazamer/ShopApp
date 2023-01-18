import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/models/homemodel/homemodel.dart';

import '../../models/categorymodel/categorymodel.dart';
import '../../services/category_services.dart';
import '../../services/home_services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  CategoryModel? categorymodel;

  void getcategorydata() async {
    emit(Categoryloading());
    try {
      categorymodel = await CategoryServices.getdata();
      emit(Categorysucsess());
    } catch (e) {
      emit(Categoryerror());
      print(e.toString());
    }
  }
}
