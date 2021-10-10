import 'package:auth_module/src/core/domain/entity/entity.dart';
import 'package:core_module/core_module.dart';



class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingUserState extends UserState {}
class ErrorUserState extends UserState {
  final String message;
  ErrorUserState(this.message);
}
class SuccessUserState extends UserState {
  final UserEntity? user;
  SuccessUserState({this.user});
  }
  class IdleUserState extends UserState {}

class BlocUser extends BlocBase{
  final IUsecaseUser _usecase;
  BlocUser(this._usecase) : super(null);

  final BehaviorSubject<UserState> _controller = BehaviorSubject.seeded(IdleUserState());
  @override
  Stream<UserState> get state => _controller.stream;
  
  Future<UserState> create(Map<String,dynamic> map)async{
    _controller.add(LoadingUserState());
    final result = await _usecase.signUp(map);
    return result.fold((l) {
      final _state = ErrorUserState(l.message);
      _controller.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessUserState();
      _controller.add(_state);
      return _state;
    }); 
  }
  Future<UserState> update(Map<String,dynamic> map)async{
    _controller.add(LoadingUserState());
    final result = await _usecase.update(map);
    return result.fold((l) {
      final _state = ErrorUserState(l.message);
      _controller.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessUserState();
      _controller.add(_state);
      return _state;
    }); 
  }
  Future<UserState> login(Map<String,dynamic> map)async{
    _controller.add(LoadingUserState());
    final result = await _usecase.signIn(map);
    return result.fold((l) {
      final _state = ErrorUserState(l.message);
      _controller.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessUserState();
      _controller.add(_state);
      return _state;
    }); 
  }
  
  Future<UserState> recoverPassword(Map<String,dynamic> map)async{
    _controller.add(LoadingUserState());
    final result = await _usecase.recoverPassword(map);
    return result.fold((l) {
      final _state = ErrorUserState(l.message);
      _controller.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessUserState();
      _controller.add(_state);
      return _state;
    }); 
  }

  Future<UserState> getUser(String id)async{
     _controller.add(LoadingUserState());
    final result = await _usecase.getUserById(id);
    return result.fold((l) {
      final _state = ErrorUserState(l.message);
      _controller.add(_state);
      return _state;
    }, (r) {
      final _state = SuccessUserState(user: r);
      _controller.add(_state);
      return _state;
    }); 
  }
 
  @override
  Future<void> close() {
    return super.close();
  }
}
