import 'package:home_module/src/core/data/datasource/idatasource_product.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:commons/error/failure.dart';
import 'package:home_module/src/core/domain/repositories/iproduct_repositories.dart';

class ProductRepository extends IProductRepository {
  final IDatasourceProduct _datasource;

  ProductRepository(this._datasource);

  @override
  Future<Either<Failure, ProductEntity>> create(Map<String, dynamic> data) async {
    try {
      return Right(await _datasource.create(data)); 
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> delete(Map<String, dynamic> data) async{
   try {
      return Right(await _datasource.delete(data)); 
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll(Map<String, dynamic> data) async{
    try {
      return Right(await _datasource.getAll(data)); 
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> update(Map<String, dynamic> data) async{
    try {
      return Right(await _datasource.update(data)); 
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }



}