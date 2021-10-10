abstract class SignUpContract {
  success();
  failure(String message);
}

class PresenterSignUp {
  final SignUpContract _contract;
  PresenterSignUp(this._contract);

  success() => _contract.success();

  failure(String message) => _contract.failure(message);
}