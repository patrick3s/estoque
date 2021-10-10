import 'package:auth_module/bloc/user_bloc.dart';
import 'package:auth_module/ui/signup/presenter_signup.dart';

import 'package:flutter/material.dart';

class ControllerSignUp {
  final PresenterSignUp presenter;
  final BlocUser bloc;
   Map<String,dynamic> user = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ControllerSignUp(this.presenter,this.bloc);

  GlobalKey<FormState> get getFormKey => _formKey;


  create()async{
    if(_formKey.currentState?.validate() == true){

      final state = await bloc.create(user);
      if(state is SuccessUserState){
        presenter.success();
        return;
      }
      presenter.failure((state as ErrorUserState).message);
    }
  }
}