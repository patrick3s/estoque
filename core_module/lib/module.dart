




import 'package:commons/commons.dart';
import 'package:dependency_module/dependency_module.dart';




class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
  ];
  
   @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule(),),
    ModuleRoute('/auth', module: AuthModule())
    //ModuleRoute('/home',module: HomeModule()),

    ];

}
