import 'package:design_system_surprise_box/design_system_surprise_box.dart';
import 'package:flutter/material.dart';

class TextButtonBorderUnilateralCircular extends StatelessWidget {
  final String label;
  final bool? left;
  final Function()? onTap;
  const TextButtonBorderUnilateralCircular({ Key? key, required this.label, this.left,this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: left == true? Radius.zero : const Radius.circular(30),
            bottomRight:left == true? Radius.zero : const Radius.circular(30),
            topLeft: left == true? const Radius.circular(30) :Radius.zero ,
            bottomLeft: left == true? const Radius.circular(30) :Radius.zero
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 4,
              spreadRadius: 5,
              color: AppColors.accent.withOpacity(.6)
            )
          ],

        
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:28.0,vertical: 19),
          child: Text(label.toUpperCase(),style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: AppColors.accent
          ),
          ),
        ),
      ),
    );
  }
}