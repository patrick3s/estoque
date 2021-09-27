import 'package:dependency_module/dependency_module.dart';
import 'package:design_system_surprise_box/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_module/utils/constants.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({ Key? key }) : super(key: key);

  @override
  _SplashUIState createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI>{
  Artboard? _artboard;
  RiveAnimationController? _controller;
  
  @override
  void initState() {
    _loadRive();
    super.initState();
   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => _existsUser());
    
  }

  Future _loadRive()async{
    final bytes = await rootBundle.load(documentsRive);
    final file = RiveFile.import(bytes);
    setState(() {
      _artboard = file.mainArtboard;
    });
    _startAnim();
  }

  _startAnim(){
    _artboard?.addController(_controller = SimpleAnimation('Example'));
    setState(() {
      _controller?.isActive =true;
    });
  
  }

  _existsUser()async{
    const userLogged = false;
    await Future.delayed(const Duration(seconds: 3));
    _controller?.dispose();
    if(!userLogged){
      Modular.to.pushNamed('auth/');
      return;
    }
    Modular.to.pushNamed('home/');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primary,
      body: Container(
        child: _artboard != null ? Rive(artboard: _artboard!,fit:BoxFit.cover) : Container(),
      ),
    );
  }
}