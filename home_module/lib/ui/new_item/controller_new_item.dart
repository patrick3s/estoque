import 'package:flutter/material.dart';
import 'package:home_module/bloc/bloc_products.dart';
import 'package:home_module/src/core/data/keys/product_keys.dart';
import 'package:home_module/src/feature/data/models/product_model.dart';
import 'package:home_module/src/feature/data/serializer/product_serializer.dart';
import 'package:home_module/ui/new_item/presenter_new_item.dart';

class ControllerNewItem {
  final BlocProducts _bloc;
  final PresenterNewItem _presenter;
  Map<String,dynamic> item = {};
  final _serializer = ProductSerializer();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ControllerNewItem(this._bloc, this._presenter);

  create()async{
    if(formKey.currentState?.validate() == true){
      _checkHasImg();
      final result = await _bloc.create(item);

      if(result is SuccessProductState){
        _presenter.success();
        item.clear();
        item.addAll(_serializer.to(result.product as ProductModel));
        _presenter.refresh();
        return;
      }

      if(result is ErrorProductState){
        _presenter.fail(result.failure.message);
      }
    }
  }
  update()async{
    
    if(formKey.currentState?.validate() == true){
      _checkHasImg();
      final result = await _bloc.update(item);
      if(result is SuccessProductState){

        _presenter.success();
        return;
      }
      if(result is ErrorProductState){
        _presenter.fail(result.failure.message);
      }
    }
  }

  delete()async{
    if(formKey.currentState?.validate() == true){
      _checkHasImg();
      final result = await _bloc.delete(item);
      if(result is SuccessProductState){
        _presenter.success();
        item.clear();
        _presenter.refresh();
        return;
      }

      if(result is ErrorProductState){
        _presenter.fail(result.failure.message);
      }
    }
  }

  _checkHasImg(){
    if(!item.containsKey(ProductKeys.productImg)){
      item[ProductKeys.productImg] = '';
    }
  }
}