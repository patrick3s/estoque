import 'package:core_module/core_module.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure,ProductEntity>> create(Map<String,dynamic> data);
  Future<Either<Failure,ProductEntity>> update(Map<String,dynamic> data);
  Future<Either<Failure,ProductEntity>> delete(Map<String,dynamic> data);
  Future<Either<Failure,List<ProductEntity>>> getAll(Map<String,dynamic> data);
 
}