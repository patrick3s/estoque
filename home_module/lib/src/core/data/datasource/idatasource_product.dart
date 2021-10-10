import 'package:home_module/src/core/domain/entity/product_entity.dart';

abstract class IDatasourceProduct {
  Future<ProductEntity> create(Map<String,dynamic> data);
  Future<ProductEntity> update(Map<String,dynamic> data);
  Future<ProductEntity> delete(Map<String,dynamic> data);
  Future<List<ProductEntity>>getAll(Map<String,dynamic> data);
 

}