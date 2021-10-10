import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/bloc/bloc_products.dart';
import 'package:home_module/src/core/data/keys/product_keys.dart';
import 'package:home_module/ui/new_item/controller_new_item.dart';
import 'package:home_module/ui/new_item/presenter_new_item.dart';

class NewItemUI extends StatefulWidget {
  final Map<String,dynamic>? item;
  const NewItemUI({ Key? key, this.item }) : super(key: key);

  @override
  _NewItemUIState createState() => _NewItemUIState();
}

class _NewItemUIState extends State<NewItemUI> implements NewItemContract{
  late final BlocProducts bloc;
  late final ControllerNewItem controller;
  @override
  initState(){
    super.initState();
    bloc = Modular.get<BlocProducts>();
    controller = ControllerNewItem(bloc
    , PresenterNewItem(this));
    controller.item.addAll(widget.item ?? {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextFormFieldCustom(
                initialValue: controller.item[ProductKeys.productName] ?? '',
                label: const Text('Nome do produto'),
                validator: Validators.mandatory,
                onChanged: (value) => controller.item[ProductKeys.productName] = value,
              ),
              TextFormFieldCustom(
                initialValue: controller.item[ProductKeys.productCod] ?? '',
                label: const Text('Codigo do produto'),
                validator: Validators.mandatory,
                onChanged: (value) => controller.item[ProductKeys.productCod] = value,
              ),
              TextFormFieldCustom(
                initialValue:controller.item[ProductKeys.productDescription] ?? '',
                label: const Text('Descrição do produto'),
                validator: Validators.mandatory,
                onChanged: (value) => controller.item[ProductKeys.productDescription] = value,
              ),
              TextFormFieldCustom(
                initialValue: controller.item[ProductKeys.productPrice] ?? '',
                label: const Text('Preço'),
                inputFormatters: [CurrencyTextInputFormatter(
                  locale: 'en',
                  decimalDigits: 2,
                  symbol: "\$"
                )],
                validator: Validators.mandatory,
                keyboardType: TextInputType.number,
                onChanged:(value) {
                  try{
                    final valueClean = value!.replaceAll(' ', '').replaceAll('\$', '').replaceAll(',','').trim();
                  final price = double.parse(valueClean);
                  controller.item[ProductKeys.productPrice] = price;
                  }catch(e){
                    return;
                  }
                },
              ),
              TextFormFieldCustom(
                initialValue: controller.item[ProductKeys.productQuantity] ?? '' ,
                label: const Text('Quantidade'),
                validator: Validators.mandatory,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  try{
                    final quantity = value?.replaceAll(' ', '').replaceAll(',', '').replaceAll('.', '') ?? '';
                  controller.item[ProductKeys.productQuantity] = int.parse(quantity);
                  }catch(e){
                    return;
                  }
                  
                },
              ),
              StreamBuilder<ProductState>(
                stream: bloc.state,
                builder: (context, snapshot) {
                  if(snapshot.data is LoadingProductState) return const  Center(child:CircularProgressIndicator());
                  return controller.item[ProductKeys.productId] == null ? Center(
                    child: ElevatedButton.icon(onPressed: controller.create, label: const Text('Salvar'), icon:const Icon(Icons.save) ) ,
                  ) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(onPressed: controller.update, label: const Text('Atualizar'),icon:const Icon(Icons.update)),
                      ElevatedButton.icon(onPressed: controller.delete, label: const Text('Deletar'),icon: const Icon(Icons.delete),)
                    ],
                  );
                }
              )

            ],
          ),
        )),
    );
  }

  @override
  fail(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        content: Text(text,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppColors.white
        ),
        )));
  }

  @override
  refresh() {
    setState(() {
      
    });
  }

  @override
  success() {
ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Operação realizada com sucesso',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppColors.white
        ),
        )));
  }
}