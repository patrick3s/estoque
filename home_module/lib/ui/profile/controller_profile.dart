import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/ui/profile/presenter_profile.dart';

class ControllerProfile {
  Map<String,dynamic> user = {};
  final PresenterProfile _presenter;
  final BlocUser _bloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  ControllerProfile(this._presenter,this._bloc);

  update()async{
    if(formKey.currentState?.validate() == true){
      final result = await _bloc.update(user);
      if(result is SuccessUserState) {
        _presenter.success();
        return;
      }
      _presenter.failure((result as ErrorUserState).message);
    }
  }
}