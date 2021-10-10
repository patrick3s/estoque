import 'package:auth_module/ui/signin/signin_ui.dart';
import 'package:auth_module/ui/signup/signup_ui.dart';
import 'package:core_module/core_module.dart';

import 'bloc/user_bloc.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => BlocUser(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (ctx,args) => const SignInUI()),
    ChildRoute('/signup', child: (ctx,args) => const SignUpUI()),

    
  ];

}