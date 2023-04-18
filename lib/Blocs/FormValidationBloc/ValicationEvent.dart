abstract class validationEvent {}

 class validationFieldEvent extends validationEvent {
  final  String email;
  final String password;
  validationFieldEvent({required this.email,required this.password});
}

 class validationButtonEvent extends validationEvent {
  final  String? email;
  final String? password;
  validationButtonEvent({this.email,this.password});
}