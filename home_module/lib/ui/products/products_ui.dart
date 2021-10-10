import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:home_module/bloc/bloc_products.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:home_module/ui/products/controller_products.dart';
import 'package:home_module/ui/products/filters.dart';
import 'package:home_module/ui/products/widgets/tabs_of_filters.dart';

import 'package:home_module/widgets/tile_item_product.dart';

class ProductsUI extends StatefulWidget {
  const ProductsUI({ Key? key }) : super(key: key);

  @override
  _ProductsUIState createState() => _ProductsUIState();
}

class _ProductsUIState extends State<ProductsUI> {
  late final BlocProducts bloc;
  late final ControllerProducts _controller;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<BlocProducts>();
    bloc.getAll();
    _controller = ControllerProducts();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<ProductState>(
        stream: bloc.state,
        builder: (context, snapshot) {
          if(snapshot.data is LoadingProductState) return const Center(child: CircularProgressIndicator(),);

          if(snapshot.data is ErrorProductState) { 
            return Center(
            child: Text((snapshot.data as ErrorProductState).failure.message),
          );
          }
          return StreamBuilder<List<ProductEntity>>(
            stream: bloc.stream,
            initialData: const [],
            builder: (context, snapshot) {
             
             if(snapshot.hasData){
               _controller.products = snapshot.data!;
                return FormField<IFilterProducts?>(
                  initialValue: null,
                  builder: (state) {
                    _controller.filter = state.value;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           TextFormFieldCustom(
                            hintText: "Digite o nome do produto",
                            onChanged: (text){
                              _controller.search = text;
                              state.didChange(state.value);
                            },
                          ),
                          
                           TabsOfFiltersProducts(filter: state.value,state: state,),
                          Expanded(
                            child: ListView(
                            children: [
                              if(_controller.getProds.isNotEmpty)...[
                                ..._controller.getProds.map((e) => TileItemProduct(product: e)).toList() 
                              ]else...[
                                const Center(
                                  child: Center(child: Text('Você não tem nenhum produto cadastrado ainda')),
                                )
                              ]
                            ],
                                ),
                          ),
                         
                        ],
                      ),
                    );
                  }
                );
             }
             
             return const Center(
               child: CircularProgressIndicator(),
             );
            }
          );
        }
      )
    );
  }
}