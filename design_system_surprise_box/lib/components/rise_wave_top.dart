
import 'package:design_system_surprise_box/design_system_surprise_box.dart';
import 'package:flutter/material.dart';

class RiseWaveTop extends StatelessWidget {
  final double? height;
  final double? width;
  final List<Color>? colors;
  const RiseWaveTop({ Key? key,this.height,this.width,this.colors }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * .2,
      width: width ?? size.width,
      child: Stack(
        children: [
          Opacity(
            opacity: .3,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.deepOrangeAccent,

              ),
            )),
            SizedBox(
              height: (height ?? size.height * .2) * .9,
              width: (width ?? size.width) * .979, 
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  decoration:  BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: colors ?? [
                  AppColors.accent,
                  AppColors.accentSecondary,
                  AppColors.accentDark
                ])
              ),
                ),
              ),
            )     
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // first wave
    var firstStart = Offset(size.width / 15 , size.height);
    var firstEnd = Offset(size.width /7.25, size.height * .7);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, 
    firstEnd.dx, firstEnd.dy);

   // second wave 
    var secondStart = Offset(size.width / 5,
     size.height * .4);
    var secondEnd = Offset(size.width * .6, size.height * .3);
    path.quadraticBezierTo(secondStart.dx, 
    secondStart.dy, 
    secondEnd.dx, 
    secondEnd.dy);
    // last wave
    var lastWaveStart = Offset(size.width * .99, size.height * .2);
    var lastWaveEnd = Offset(size.width * .98, 0);
    path.quadraticBezierTo(lastWaveStart.dx, 
    lastWaveStart.dy, 
    lastWaveEnd.dx, 
    lastWaveEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this != oldClipper;
  }

}