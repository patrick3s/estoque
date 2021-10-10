import 'package:auth_module/auth_module.dart';
import 'package:auth_module/bloc/user_bloc.dart';
import 'package:auth_module/src/core/data/keys_models/user_keys.dart';
import 'package:auth_module/ui/signin/presenter_signin.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';


class ControllerSignIn {
  final BlocUser _bloc;
  final PresenterSignIn _presenter;
  Map<String,dynamic> user = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  ControllerSignIn(this._bloc, this._presenter);
  login()async{
    if(_formKey.currentState?.validate() == true){
      final result = await _bloc.login(user);
      if(result is SuccessUserState){
        _presenter.succes();
      }else if(result is ErrorUserState){
        _presenter.failure(result.message);
      }
    }
  }

  recoverPassword()async{
    if(!user.containsKey(UserKeys.email)){
      _presenter.failure('Informe um email');
      return ;
    }
    final errorEmail = Validators.email(user[UserKeys.email]);
    if(errorEmail != null){
      _presenter.failure(errorEmail);
      return ;
    }

    final result = await _bloc.recoverPassword(user);
    if(result is SuccessUserState){
      _presenter.succes(text: "Email enviado com sucesso, verifique a caixa de spam");
      return ;
    }
    if(result is ErrorUserState){
      _presenter.failure(result.message);
    }
  }

}