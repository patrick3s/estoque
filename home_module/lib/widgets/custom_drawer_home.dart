import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class CustomDrawerHome extends StatelessWidget {
  final _admob = AdmobService();
   CustomDrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .15,
              width: double.infinity,
              child: Center(
                  child: Text(EnvApp.appName,
                      style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black))),
            ),

            _tileItemDrawer(icon: Icons.home, label: "Produtos", context: context, onTap: (){
              Modular.to.pop();
              Modular.to.navigate('products');
              _admob.showIntertistial();
            }),
            _tileItemDrawer(icon: Icons.add_box, label: "Novo produto", context: context, onTap: (){
               Modular.to.pop();
              Modular.to.navigate('new_item');
              _admob.showIntertistial();
            }),
            _tileItemDrawer(icon: Icons.document_scanner, label: "Relatorio", context: context, onTap: (){
               Modular.to.pop();
              Modular.to.navigate('relatory');
              _admob.showIntertistial();
            }),
            _tileItemDrawer(icon: Icons.person, label: "Perfil", context: context, onTap: (){
               Modular.to.pop();
              Modular.to.navigate('profile');
              _admob.showIntertistial();
            })
          ],
        ),
      ),
    );
  }

  _tileItemDrawer({required IconData icon,required String label, required BuildContext context,required  Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Icon(icon),
            const SizedBox(width: 20,),
            Text(label,
            style: Theme.of(context).textTheme.subtitle1
            )
          ],
        ),
      ),
    );
  }
}
