part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Homeloading extends HomeState {}

class Homesucsess extends HomeState {}

class Homeerror extends HomeState {}

class changefavoritesucsess extends HomeState {}

class changefavoriteerror extends HomeState {}
