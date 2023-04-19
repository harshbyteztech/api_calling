import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit1 extends Cubit<int>{
  CounterCubit1(): super(0);

  void increament() =>emit(state +1);
  void decreament() =>emit(state -1);
}