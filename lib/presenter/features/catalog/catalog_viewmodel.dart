import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class CatalogViewModel extends BaseViewModel {

  late final DateTime initData;

  String  getCreate() => initData.toIso8601String();

  CatalogViewModel(){
    init();
  }

  Future<void> init() async{
    initData = DateTime.now();
    // while (true) {
    //   await Future.delayed(const Duration(seconds: 1));
    //   print('live');
    // }
  }


  // final ApiDataSource _apiDataSource;
  //
  // CatalogViewModel(this._apiDataSource);
  //
  // Future<List<CatalogItem>> getCatalog ({
  //   required String catalog,
  //   required int count,
  //   required int offset,
  //   String? search,
  // }) async {
  //
  //   setBusy(true);
  //
  //   final response = await _apiDataSource.api.catalogGet(
  //     catalog: catalog,
  //     count: count,
  //     offset: offset,
  //     search: search,
  //   );
  //
  //   setBusy(false);
  //
  //   if (response.statusCode == 200) {
  //     return response.body ?? [];
  //   } else {
  //     throw Exception(response.body);
  //   }
  //
  //
  // }


}
