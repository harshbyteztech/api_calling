import 'package:api_calling/Blocs/FormValidationBloc/ValicationEvent.dart';
import 'package:api_calling/Blocs/FormValidationBloc/ValidationState.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  validationBloc extends Bloc<validationEvent,validationState>{
  validationBloc() : super(validationInitialState()){

    on<validationFieldEvent>((event, emit) {
      if( EmailValidator.validate("${event.email}") == false){
        emit(validationErrorState(errorMessage: 'please Enter Valid Email'));
      }else if(event.password.length < 8){
        emit(validationErrorState(errorMessage: 'Please Enter Valid Passowrd'));
      }
      else {
        emit(validationValidState());
      }
    });

    on<validationButtonEvent>((event, emit) {
      emit(validationLoadingState());
    });
  }
}