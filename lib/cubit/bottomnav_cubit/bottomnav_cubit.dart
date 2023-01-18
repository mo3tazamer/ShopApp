import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/homelayout/category_screen.dart';
import '../../pages/homelayout/favorite_screen.dart';
import '../../pages/homelayout/products_screen.dart';
import '../../pages/homelayout/setting_screen.dart';
import '../profile_cubit/profile_cubit.dart';
part 'bottomnav_state.dart';

class BottomnavCubit extends Cubit<BottomnavState> {
  BottomnavCubit() : super(BottomnavInitial());

  int indexvalue = 0;

  void changebottom(int index, context) {
    indexvalue = index;
    if (indexvalue == 0) {
      emit(Bottomnavsucsess());
    }
    if (indexvalue == 1) {
      emit(Bottomnavsucsess());
    }
    if (indexvalue == 2) {
      emit(Bottomnavsucsess());
    }
    if (indexvalue == 3) {
      BlocProvider.of<ProFileCubit>(context).getProFiledata();
      emit(Bottomnavsucsess());
    }
    // لو كل شاشة برقم و نديها جيت داتا من الاول
  }

  var bottomScreen = [
    const Product(),
    const Category(),
    const Favorit(),
    Settings(),
  ];
}
