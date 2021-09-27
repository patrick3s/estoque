import 'package:auth_module/ui/signin/signin_ui.dart';
import 'package:auth_module/ui/signup/signup_ui.dart';
import 'package:dependency_module/dependency_module.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (ctx,args) => const SignInUI()),
    ChildRoute('/signup', child: (ctx,args) => const SignUpUI()),
    
  ];

}