abstract class validationState {}

 class validationInitialState extends validationState {}

 class validationValidState extends validationState {}

 class validationErrorState extends validationState {
  final String? errorMessage;
  validationErrorState({this.errorMessage});
}

class validationLoadingState extends validationState {}