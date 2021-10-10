

abstract class SignInContract {
  success({String? text});
  failure(String message);
}

 class PresenterSignIn{
  final SignInContract _contract;

  PresenterSignIn(this._contract);

  succes({String? text}) => _contract.success(text:text);

  failure(String message) => _contract.failure(message);
}