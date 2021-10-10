import 'package:design_system_surprise_box/design_system_surprise_box.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final Function()? onTap;
  final IconData icon;
  const CircleButton({ Key? key,required this.size,this.onTap, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.purple.withOpacity(.5),
                AppColors.primary
                ])
            ),
            child: Icon(icon,
            size: size * .5,
            color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}