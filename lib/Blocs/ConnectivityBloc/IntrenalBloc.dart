import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'IntrenalBloc.dart';

enum InternalState{Initial,Gained,Lose}

class InternalBloc extends Cubit<InternalState>{
  Connectivity _connectivity =  Connectivity();
  StreamSubscription? conectivoitySubcription;

  InternalBloc() : super(InternalState.Initial){
    conectivoitySubcription = _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile||event == ConnectivityResult.wifi){
        emit(InternalState.Gained);
      }else {
        emit(InternalState.Lose);
      }
    });
  }
  Future<void> close(){
    conectivoitySubcription?.cancel();
    return super.close();
  }
}