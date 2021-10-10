import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:home_module/src/core/data/datasource/idatasource_product.dart';
import 'package:home_module/src/core/data/keys/product_keys.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:home_module/src/feature/data/serializer/product_serializer.dart';

class ProductDatasource extends IDatasourceProduct {
  final Api api;
  static const String _endpoint = "products/user/";
  final ProductSerializer _serializer = ProductSerializer();
  ProductDatasource(this.api);
  @override
  Future<ProductEntity> create(Map<String, dynamic> data) async {
    final response = await api.post(_endpoint + AuthHelper.getUser!.id,
        token: true, body: jsonEncode(data));
    return _serializer.from(response);
  }

  @override
  Future<ProductEntity> delete(Map<String, dynamic> data) async {
    final response = await api.delete(
        _endpoint +
            AuthHelper.getUser!.id +
            '/product/' +
            data[ProductKeys.productId].toString(),
        token: true,
        body: jsonEncode(data));
    return _serializer.from(response);
  }

  @override
  Future<List<ProductEntity>> getAll(Map<String, dynamic> data) async {
    await AuthHelper.currentUser;
    final id = int.parse(AuthHelper.getUser!.id);
    final response =
        await api.get(_endpoint + "$id", token: true);
     
    return List.from(response).map((e) => _serializer.from(e)).toList();
  }

  @override
  Future<ProductEntity> update(Map<String, dynamic> data) async {
    final response = await api.put(
        _endpoint +
            AuthHelper.getUser!.id +
            '/product/' +
            data[ProductKeys.productId].toString(),
        token: true,
        body: jsonEncode(data));
    return _serializer.from(response);
  }

  
}
