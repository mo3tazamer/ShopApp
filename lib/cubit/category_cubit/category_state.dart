part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class Categoryloading extends CategoryState {}

class Categorysucsess extends CategoryState {}

class Categoryerror extends CategoryState {}
