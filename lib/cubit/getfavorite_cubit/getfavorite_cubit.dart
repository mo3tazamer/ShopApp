import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/favoritemodel/favoritemodel.dart';
import '../../services/getfavorite_services.dart';

part 'getfavorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(getfavoriteInitial());

  FavoriteModel? favoriteModel;

  void getfavoritedata() async {
    emit(getfavoriteloading());
    try {
      favoriteModel = await FavoriteServices.getdata();
      emit(getfavoritesucsess());
    } catch (e) {
      emit(getfavoriteerror());
      print(e.toString());
    }
  }
}
