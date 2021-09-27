import 'package:flutter/material.dart';
class MainHomeRouteUI extends StatefulWidget {
  const MainHomeRouteUI({ Key? key }) : super(key: key);

  @override
  _MainHomeRouteUIState createState() => _MainHomeRouteUIState();
}

class _MainHomeRouteUIState extends State<MainHomeRouteUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Text('Home'),
      )),
    );
  }
}