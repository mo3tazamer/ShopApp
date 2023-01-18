import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/searchmodel/searchmodel.dart';
import '../../services/search_services.dart';
part 'search_state.dart';

class Searchcubit extends Cubit<SearchcubitState> {
  Searchcubit() : super(SearchcubitInitial());

  SearchModel? searchModel;

  void Postdata({required String text}) async {
    emit(Searchcubitloading());
    try {
      searchModel = await SearchServices.postdata(
        text: text,
      );
      emit(Searchcubitsucsess());
      print(searchModel!.data.data[0].image);
    } catch (e) {
      print(e.toString());
      emit(Searchcubiterror());
    }
  }
}
