import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';

abstract class CatalogNewState{}
class LoadCatalogNewState extends CatalogNewState{}
class ErrorCatalogNewState extends CatalogNewState{
  final String? errorMessage;

  ErrorCatalogNewState({this.errorMessage});
}
class DataCatalogNewState extends CatalogNewState{
  final List<CatalogItem> list;
  final String strSearch;

  DataCatalogNewState({required this.list, required this.strSearch});
}

