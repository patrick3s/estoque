import 'package:core_module/core_module.dart';
class ProductEntity extends Equatable{
  final int productId;
  final String productName;
  final String productDescription;
  final String productImg;
  final int productQuantity;
  final double productPrice;
  final String productCod;
  final int userId;
  final String createAt;

  const ProductEntity(
    this.productId, 
    this.productName, 
    this.productDescription, 
    this.productImg, 
    this.productQuantity, 
    this.productPrice, 
    this.productCod, 
    this.userId, 
    this.createAt);

  @override
  List<Object?> get props => [
    productId,
    productName,
    createAt
  ];

}