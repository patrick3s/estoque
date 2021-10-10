import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:commons/error/failure.dart';
import 'package:home_module/src/core/domain/repositories/iproduct_repositories.dart';
import 'package:home_module/src/core/domain/usecase/iproduct_usecase.dart';


class ProductUsecase extends IProductUsecase {
  final IProductRepository _repository;

  ProductUsecase(this._repository);
  @override
  Future<Either<Failure, ProductEntity>> create(Map<String, dynamic> data) async{
    return await _repository.create(data);
  }

  @override
  Future<Either<Failure, ProductEntity>> delete(Map<String, dynamic> data) async {
    return await _repository.delete(data);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAll(Map<String, dynamic> data) async {
    return await _repository.getAll(data);
  }

  @override
  Future<Either<Failure, ProductEntity>> update(Map<String, dynamic> data) async {
    return await _repository.update(data);
  }


  
}