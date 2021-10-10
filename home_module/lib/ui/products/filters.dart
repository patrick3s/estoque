import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:home_module/src/feature/data/models/product_model.dart';

abstract class IFilterProducts {
  List<ProductModel> filter(List<ProductEntity> products);
}

class FilterProductsByCreateAt extends IFilterProducts {
  @override
  List<ProductModel> filter(List<ProductEntity> products) {
    Comparator<ProductModel> comparator;
    comparator = (a,b) => a.dateTime.compareTo(b.dateTime);
    List<ProductModel> _products = List.from(products).map((e) => e as ProductModel).toList();
    _products.sort(comparator);
    return _products;
  }

}

class FilterProductsByName extends IFilterProducts {
  @override
  List<ProductModel> filter(List<ProductEntity> products) {
     Comparator<ProductModel> comparator;
    comparator = (a,b) => a.productName.compareTo(b.productName);
    List<ProductModel> _products = List.from(products).map((e) => e as ProductModel).toList();
    _products.sort(comparator);
    return _products;
  }

}

class FilterProductsByPrice extends IFilterProducts {
  @override
  List<ProductModel> filter(List<ProductEntity> products) {
     Comparator<ProductModel> comparator;
    comparator = (a,b) => a.productPrice.compareTo(b.productPrice);
    List<ProductModel> _products = List.from(products).map((e) => e as ProductModel).toList();
    _products.sort(comparator);
    return _products;
  }

}

class FilterProductsByQuantity extends IFilterProducts {
  @override
  List<ProductModel> filter(List<ProductEntity> products) {
    Comparator<ProductModel> comparator;
    comparator = (a,b) => a.productQuantity.compareTo(b.productQuantity);
    List<ProductModel> _products = List.from(products).map((e) => e as ProductModel).toList();
    _products.sort(comparator);
    return _products;
  }

}