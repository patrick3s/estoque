import 'package:core_module/core_module.dart';
import 'package:home_module/src/core/domain/entity/product_entity.dart';
import 'package:home_module/src/feature/domain/usecase/product_usecase.dart';

abstract class ProductState {}

class IdleProductState extends ProductState {}
class LoadingProductState extends ProductState {}
class ErrorProductState extends ProductState {
  final Failure failure;
  ErrorProductState(this.failure);
}
class SuccessProductState extends ProductState{
  final ProductEntity? product;
  SuccessProductState({this.product});
}


class BlocProducts  {

  final BehaviorSubject<List<ProductEntity>> _controllerStream = BehaviorSubject.seeded([]);
  final BehaviorSubject<ProductState> _controllerState = BehaviorSubject.seeded(IdleProductState());

  BlocProducts(this.usecase);

  Stream<List<ProductEntity>> get stream => _controllerStream.stream;
  Stream<ProductState> get state => _controllerState.stream;
  final ProductUsecase usecase;
  Future<ProductState> create(Map<String,dynamic> map)async{
    _controllerState.add(LoadingProductState());
    final result = await usecase.create(map);
    return result.fold((l) {
      final _state = ErrorProductState(l);
      _controllerState.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessProductState(product: r);
      _controllerState.add(_state);
      return _state;
    });
  }
  Future<ProductState> update(Map<String,dynamic> map)async{
    _controllerState.add(LoadingProductState());
    final result = await usecase.update(map);
    return result.fold((l){
      final _state = ErrorProductState(l);
      _controllerState.add(_state);
      return _state;
    }, 
    (r) {
      final _state = SuccessProductState(product: r);
      _controllerState.add(_state);
      return _state;
    });
  }
   Future<ProductState> delete(Map<String,dynamic> map) async{
    _controllerState.add(LoadingProductState());
    final result = await usecase.delete(map);
    return result.fold((l){
      final _state = ErrorProductState(l);
      _controllerState.add(_state);
      return _state;
    }, 
    (r) {
      final _state = SuccessProductState(product: r);
      _controllerState.add(_state);
      return _state;
    });
  }


  getAll()async{

    _controllerState.add(LoadingProductState());
    final result = await usecase.getAll({});
    return result.fold((l){
      final _state = ErrorProductState(l);
      _controllerState.add(_state);
      return _state;
    }, 
    (r) {
      final _state = SuccessProductState();
      _controllerState.add(_state);
      _controllerStream.add(r);
      return _state;
    });
  }

  


 dispose(){
   _controllerStream.close();
   _controllerState.close();
 }
  
}