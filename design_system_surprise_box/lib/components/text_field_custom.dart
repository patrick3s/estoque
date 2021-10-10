import 'package:design_system_surprise_box/design_system_surprise_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Widget? label;
  final String? hintText;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function(String?)? onSubmitted;
  final Function()? onEdittingComplete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final dynamic initialValue;
  final double? elevation;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscure;
  final Widget? sufixIcon;
  final bool? enabled;
  final TextInputType? keyboardType;
  const TextFormFieldCustom({ Key? key,this.label,this.hintText, this.enabled, this.onSubmitted,this.onChanged, this.elevation,this.obscure,
  this.onSaved, this.controller,this.keyboardType , this.initialValue,this.inputFormatters,
  this.onEdittingComplete,this.validator, this.prefixIcon,this.sufixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation ?? 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 1),
          child: TextFormField(
            keyboardType: keyboardType,
            validator: validator,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            enabled: enabled,
            controller: controller,
            initialValue: initialValue != null && initialValue != 'None' ? initialValue.toString() : '',
            inputFormatters: inputFormatters,
            onEditingComplete: onEdittingComplete,
            obscureText: obscure ?? false,
            onSaved: onSaved,
            style: Theme.of(context).textTheme.subtitle1,
            decoration:  InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,
              label: label,
              labelStyle: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.hintColor
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: AppColors.hintColor),
             enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
             border: const OutlineInputBorder(borderSide: BorderSide.none)
          ),
      ),
        ),
      );
  }
}