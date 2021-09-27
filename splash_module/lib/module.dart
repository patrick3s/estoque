import 'package:dependency_module/dependency_module.dart' ;
import 'package:splash_module/ui/splash.dart';

class SplashModule extends Module {
 @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (ctx,args) => const SplashUI())
  ];
}