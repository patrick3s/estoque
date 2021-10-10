import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:home_module/src/feature/data/models/product_model.dart';
import 'package:home_module/ui/products/filters.dart';

class ControllerProducts {
  List<ProductEntity> _products = [];
  IFilterProducts? _filter;
  String? _search;
  set search(String? search) => _search = search;
  set products(List<ProductEntity> prods) => _products = prods;
  set filter(IFilterProducts? filter) => _filter = filter;
  List<ProductModel> get getProds {
    if (_filter == null) {
      final _prods =List.from(_products).map((e) => e as ProductModel).toList();
      _prods.retainWhere((element) => element.productName.contains(_search ?? ''));
      return _prods;
    }
    final _prods = _filter!.filter(_products);
    _prods
        .retainWhere((element) => element.productName.contains(_search ?? ''));
    return _prods;
  }
}
