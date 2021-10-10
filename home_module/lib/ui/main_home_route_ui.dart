import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/widgets/custom_drawer_home.dart';

class MainHomeRouteUI extends StatefulWidget {
 
  const MainHomeRouteUI({Key? key})
      : super(key: key);

  @override
  _MainHomeRouteUIState createState() => _MainHomeRouteUIState();
}

class _MainHomeRouteUIState extends State<MainHomeRouteUI> {

  int index = 0;
   final Map<int,String> routes = {0:'products',1:'new_item',2:'relatory'};
  late final AdmobService _admob;
  @override
  void initState() {
    super.initState();
    _admob = AdmobService();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:_appBar() ,
      drawer:  CustomDrawerHome(),
      body: Column(
        children: [
          Expanded(child: RouterOutlet()),
          _admob.showBanner()
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(){
    return AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(EnvApp.appName),
        actions: [IconButton(onPressed: (){
          AuthHelper.logout();
        }, 
        icon: const Icon(Icons.logout))],
      );
  }



  
}
