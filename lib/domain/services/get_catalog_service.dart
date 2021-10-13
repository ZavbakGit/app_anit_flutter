import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:stacked/stacked.dart';

class GetCatalogService with ReactiveServiceMixin {
  final ApiDataSource _apiDataSource;

  final ReactiveValue<List<CatalogItem>> _listCatalog =
      ReactiveValue<List<CatalogItem>>([]);

  GetCatalogService(this._apiDataSource) {
    listenToReactiveValues([_listCatalog]);
  }

  List<CatalogItem> get listCatalog => _listCatalog.value;

  Future<void> getCatalog({required String catalog, required int count, required int offset, String? search}) async {
    await Future.delayed(const Duration(seconds: 2));

    final response = await _apiDataSource.api.catalogGet(
      catalog: catalog,
      count: count,
      offset: offset,
      search: search,
    );



    if (response.statusCode == 200) {
      _listCatalog.value = response.body ?? [];
    } else {
      throw Exception(response.body);
    }
  }
}
