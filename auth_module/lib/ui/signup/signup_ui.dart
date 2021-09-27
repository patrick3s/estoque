import 'package:flutter/material.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({ Key? key }) : super(key: key);

  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('SignUpUI'),
      )),
    );
  }
}