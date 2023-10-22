import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(margin: const EdgeInsets.only(top: 25)),
            submitButton(),
          ],
        ));
  }

  Widget emailField(Bloc? bloc) {
    return StreamBuilder(
        stream: bloc?.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc?.changeEmail,
          );
        });
  }

  Widget passwordField(Bloc? bloc) {
    return StreamBuilder(
        stream: bloc?.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              labelText: 'type your password',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc?.changePassword,
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () => {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      ),
      child: const Text('log in'),
    );
  }
}
