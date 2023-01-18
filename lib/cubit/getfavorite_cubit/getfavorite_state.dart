part of 'getfavorite_cubit.dart';

@immutable
abstract class GetFavoriteState {}

class getfavoriteInitial extends GetFavoriteState {}

class getfavoriteloading extends GetFavoriteState {}

class getfavoritesucsess extends GetFavoriteState {}

class getfavoriteerror extends GetFavoriteState {}
