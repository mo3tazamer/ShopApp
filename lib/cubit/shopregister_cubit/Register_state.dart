part of 'Register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegistercubitInitial extends RegisterState {}

class Registercubitloading extends RegisterState {}

class Registercubitsucsess extends RegisterState {}

class Registercubiterror extends RegisterState {}
