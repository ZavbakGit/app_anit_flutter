import 'dart:async';

import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

//@injectable
class CatalogViewModel extends BaseViewModel {
  final ApiDataSource? _apiDataSource;
  late String timeCreate;
  Timer? _debounce;

  List<CatalogItem> listCatalogItem = [];
  String _searchQuery = '';

  query(String value){
    if (_searchQuery != value && value.length > 2){
      _searchQuery = value;
      _getCatalog(catalog: 'Номенклатура',count: 50,offset: 0,search: _searchQuery);
    }
  }

  CatalogViewModel(@factoryParam this._apiDataSource) {
    timeCreate = DateTime.now().toString();
  }

  Future<void> _getCatalog({
    required String catalog,
    required int count,
    required int offset,
    String? search,
  }) async {
    setBusy(true);



    await Future.delayed(const Duration(seconds: 2));

    final response = await _apiDataSource!.api
        .catalogGet(
      catalog: catalog,
      count: count,
      offset: offset,
      search: search,
    )
        .catchError((e) {

      listCatalogItem = [];
      setError(e.toString());

      //Тут надо вернуть Future
    });

    setBusy(false);

    if (response.statusCode == 200) {
      listCatalogItem = response.body ?? [];
    } else {
      setError('Error query');
    }

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }
}
