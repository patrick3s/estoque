import 'package:flutter/material.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({ Key? key }) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('SignInUi'),
      )),
    );
  }
}