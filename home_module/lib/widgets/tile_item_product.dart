import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import 'package:home_module/src/feature/data/models/product_model.dart';
import 'package:home_module/src/feature/data/serializer/product_serializer.dart';

class TileItemProduct extends StatelessWidget {
  final ProductModel product;
  const TileItemProduct({ Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.view_in_ar,
                  size: size.width * .2,
                  ),
                  const SizedBox(
                    width:10
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.productName,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: size.width * .045,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text('Quantidade : ${product.productQuantity}',style: Theme.of(context).textTheme.bodyText1,),
                        Text('\$ : ${product.productPrice}',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Modular.to.navigate('new_item',arguments: ProductSerializer().to(product));
                      }, 
                      icon: Icon(Icons.edit,
                      size: size.width * .08,
                      )),
                    
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}