import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../Blocs/ConnectivityBloc/IntrenalBloc.dart';
import 'otp.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _controller = TextEditingController();

  // Future<UserCredential> signInWithFacebook() async {
  //   print('facebook');
  //   // try{
  //   //   final result = await FacebookAuth.getInstance();
  //   // }
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
      ),
      body: BlocConsumer<InternalBloc, InternalState>(
        builder: (context, state) {
          if (state == InternalState.Gained) {
            return const Center(
              child: Text('Connected',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            );
          } else if (state == InternalState.Lose) {
            return const Center(
              child: Text('Not connected',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            );
          } else {
            return const Center(
              child: Text('Loading....',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            );
          }
        },
        listener: (context, state) {
          if (state == InternalState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Internet connected'),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternalState.Lose) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Internet Not  connected'),
              backgroundColor: Colors.red,
            ));
          }
        },
      ),
      //   floatingActionButton: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       FloatingActionButton(onPressed: () {
      //         context.read<InternalBloc>().add(InternalEventGained());
      // },child: Center(child: Icon(Icons.add)),),
      //       SizedBox(height: 10,),
      //       FloatingActionButton(onPressed: () {
      // context.read<InternalBloc>().add(InternalEventLose());
      // },child: Center(child: Icon(Icons.remove)),),
      //     ],
      //   ),
    );
  }
}
