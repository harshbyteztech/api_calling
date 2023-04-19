import '../../Models/pray_model.dart';

abstract class ApiState {}

 class ApiLoadingState extends ApiState {}


 class ApiLoadedState extends ApiState {
  final List<PrayModel>? pray_model;
  ApiLoadedState({this.pray_model});
 }


 class ApiErrorState extends ApiState {
  final String? ErrorMessage;
  ApiErrorState({this.ErrorMessage});
 }