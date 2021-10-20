import 'package:app_anit_flutter/core/utils/logger.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:stacked/stacked.dart';
import 'catalog_new_state.dart';

abstract class CatalogNewViewModel extends BaseViewModel {
  CatalogNewState get getState;

  Future<void> query(String string);
}

class MockCatalogViewModel extends CatalogNewViewModel {
  final log = getLogger('LoginViewModel');

  List<CatalogItem> get _getMockListCatalog => Iterable<int>.generate(50)
      .map((i) => CatalogItem(
          code: '$i',
          name: 'Name $i',
          guid: 'guid $i',
          markDeletion: i % 2 == 0))
      .toList();

  CatalogNewState _state = DataCatalogNewState(list: [], strSearch: '');

  @override
  CatalogNewState get getState => _state;

  @override
  Future<void> query(String str) async {
    log.i('query $str');
    if (str.length > 4) {
      _state = LoadCatalogNewState();
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      _state = ErrorCatalogNewState(errorMessage: 'Error ....');
      notifyListeners();

    }else if (str.length > 2) {
      _state = LoadCatalogNewState();

      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));
      _state = DataCatalogNewState(
        list: _getMockListCatalog,
        strSearch: str,
      );
      notifyListeners();
    }
  }
}
