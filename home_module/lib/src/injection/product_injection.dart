import 'package:core_module/core_module.dart';
import 'package:home_module/src/feature/data/datasource/datasource_product.dart';
import 'package:home_module/src/feature/domain/repositories/product_repository.dart';
import 'package:home_module/src/feature/domain/usecase/product_usecase.dart';

final $usecaseProduct = BindInject((i) => 
ProductUsecase(ProductRepository(
  ProductDatasource(i())
)));