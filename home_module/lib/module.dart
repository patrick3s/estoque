import 'package:dependency_module/dependency_module.dart';
import 'package:home_module/ui/main_home_route_ui.dart';


class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (ctx,args) => const MainHomeRouteUI(),
    children: []
    )
  ];

}