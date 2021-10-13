//Generated code

part of 'swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Swagger extends Swagger {
  _$Swagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Swagger;

  @override
  Future<Response<User>> authGet() {
    final $url = '/auth';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<User, User>($request);
  }

  @override
  Future<Response<List<CatalogItem>>> catalogGet(
      {required String? catalog,
      required int? count,
      required int? offset,
      String? search}) {
    final $url = '/catalog';
    final $params = <String, dynamic>{
      'catalog': catalog,
      'count': count,
      'offset': offset,
      'search': search
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<CatalogItem>, CatalogItem>($request);
  }
}
