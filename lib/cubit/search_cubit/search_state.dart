part of 'search_cubit.dart';

@immutable
abstract class SearchcubitState {}

class SearchcubitInitial extends SearchcubitState {}

class Searchcubitloading extends SearchcubitState {}

class Searchcubitsucsess extends SearchcubitState {}

class Searchcubiterror extends SearchcubitState {}
