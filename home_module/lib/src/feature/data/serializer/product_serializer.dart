import 'package:core_module/core_module.dart';
import 'package:home_module/src/core/data/keys/product_keys.dart';
import 'package:home_module/src/feature/data/models/product_model.dart';

class ProductSerializer extends Serializer<ProductModel,Map<String,dynamic>>{
  @override
  ProductModel from(Map<String, dynamic> data) {
    return ProductModel(
      data[ProductKeys.productId],
      data[ProductKeys.productName],
      data[ProductKeys.productDescription],
      data[ProductKeys.productImg],
      data[ProductKeys.productQuantity],
      data[ProductKeys.productPrice],
      data[ProductKeys.productCod],
      data[ProductKeys.userId],
      data[ProductKeys.productCreateAt]
    );
  }

  @override
  Map<String, dynamic> to(ProductModel data) {
    return {
      ProductKeys.productId: data.productId,
      ProductKeys.productName: data.productName,
      ProductKeys.productDescription:data.productDescription,
      ProductKeys.productImg:data.productImg,
      ProductKeys.productQuantity:data.productQuantity,
      ProductKeys.productPrice:data.productPrice,
      ProductKeys.productCod:data.productCod,
      ProductKeys.userId:data.userId,
      ProductKeys.productCreateAt: data.createAt
    };
  }
}