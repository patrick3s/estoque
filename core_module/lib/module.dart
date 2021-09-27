


import 'package:auth_module/module.dart';
import 'package:core_module/util/auth_helper.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:home_module/module.dart';


import 'package:splash_module/splash_module.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => AuthHelper())
  ];
  
   @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule(),),
    ModuleRoute('/auth', module: AuthModule())
    //ModuleRoute('/home',module: HomeModule()),

    ];

}
