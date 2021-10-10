abstract class NewItemContract {
  refresh();
  success();
  fail(String text);
}


class PresenterNewItem {
  final NewItemContract _contract;
  PresenterNewItem(this._contract);
  refresh() => _contract.refresh();
  success() => _contract.success();
  fail(text) => _contract.fail(text);
}