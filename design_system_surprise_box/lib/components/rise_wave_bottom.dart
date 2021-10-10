import 'package:design_system_surprise_box/design_system_surprise_box.dart';
import 'package:flutter/material.dart';

class RiseWaveBottom extends StatelessWidget {
  final double? height;
  final double? width;
   const RiseWaveBottom({ Key? key,this.height,this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
               angle: 361.27,
               child:  RiseWaveTop(
                 height: height,
                 width: width,
                 colors:  [
                   Colors.blue.withOpacity(.5),
                   Colors.blue,
                   Colors.purple.withOpacity(.5)
                 ],
               ),
             );
  }
}