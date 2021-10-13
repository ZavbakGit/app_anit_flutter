import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class CatalogViewModel extends BaseViewModel {
  final ApiDataSource? _apiDataSource;

  List<CatalogItem> listCatalogItem = [];

  CatalogViewModel(@factoryParam this._apiDataSource);

  Future<void> getCatalog({
    required String catalog,
    required int count,
    required int offset,
    String? search,
  }) async {
    setBusy(true);

    await Future.delayed(const Duration(seconds: 2));

    final response = await _apiDataSource!.api.catalogGet(
      catalog: catalog,
      count: count,
      offset: offset,
      search: search,
    );

    setBusy(false);

    if (response.statusCode == 200) {
      listCatalogItem = response.body ?? [];
    } else {
      setError('Error query');
    }

    notifyListeners();
  }
}
