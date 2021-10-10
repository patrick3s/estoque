// ignore_for_file: overridden_fields, annotate_overrides

import 'package:home_module/src/core/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  final int productId;
  final String productName;
  final String productDescription;
  final String productImg;
  final int productQuantity;
  final double productPrice;
  final String productCod;
  final int userId;
  final String createAt;

  const ProductModel(this.productId, this.productName, this.productDescription, this.productImg, this.productQuantity, this.productPrice, this.productCod, this.userId, this.createAt):
  super(
    productId, 
    productName, 
    productDescription, 
    productImg, 
    productQuantity, 
    productPrice, 
    productCod, 
    userId, 
    createAt);
  
  DateTime get dateTime {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(createAt));
  }


}