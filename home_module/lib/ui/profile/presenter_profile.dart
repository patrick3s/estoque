abstract class ContractProfile {
  success();
  failure(String text);
}

class PresenterProfile  {
  final ContractProfile _contractProfile;
  PresenterProfile(this._contractProfile);

  success()=>_contractProfile.success();
  failure(String text)=>_contractProfile.failure(text);

}