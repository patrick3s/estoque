

import 'package:core_module/core_module.dart';
import 'package:home_module/bloc/bloc_products.dart';
import 'package:home_module/src/injection/product_injection.dart';

import 'package:home_module/ui/main_home_route_ui.dart';
import 'package:home_module/ui/new_item/new_item_ui.dart';

import 'package:home_module/ui/products/products_ui.dart';
import 'package:home_module/ui/profile/profile_ui.dart';
import 'package:home_module/ui/relatory/relatory_ui.dart';


class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    $usecaseProduct,
    Bind((i) => BlocProducts(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (ctx,args) => const MainHomeRouteUI( ),
    children: [
      ChildRoute('/products', child: (ctx,args) => const ProductsUI()),
      ChildRoute('/new_item', child: (ctx,args) =>  NewItemUI(item: args.data,)),
      ChildRoute('/relatory', child: (ctx,args) => const RelatoryUI()),
      ChildRoute('/profile', child: (ctx,args) => const ProfileUI())
    ]
    )
  ];

}