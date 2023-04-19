import 'package:api_calling/Blocs/CounterBloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: Text('Counter App')),
      body: BlocBuilder<CounterCubit1, int>(
        builder: (context, state) {
          return Center(
              child: Text(
            state.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit1>(context).increament();
            },
            child: Center(child: Icon(Icons.add)),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit1>(context).decreament();
            },
            child: Center(child: Icon(Icons.remove)),
          ),
        ],
      ),
    );
  }
}
