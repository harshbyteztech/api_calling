abstract class validationEvent {}

 class validationFieldEvent extends validationEvent {
  final  String email;
  final String number;
  validationFieldEvent({required this.email,required this.number});
}

 class validationButtonEvent extends validationEvent {
  final  String? email;
  final String? number;
  validationButtonEvent({this.email,this.number});
}