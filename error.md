Hey!
If I use the annotation - @lazySingleton, I get an error while generating the code:

only factories can have parameters
package: app_anit_flutter / data / api / api_data_source.dart: 13: 7

If I use @injectable then no error occurs.

```dart
@module
abstract class AppModule {
  
  //@lazySingleton
  @injectable 
  ApiDataSource getApiDataSource(@factoryParam AuthBaseModel? authBaseModel) =>
      ApiDataSource(authBaseModel);

  @lazySingleton
  AuthBaseModel getAuthBaseModel() => AuthBaseModel(
        password: dotenv.env['TEST_PASS'] ?? '',
        user: dotenv.env['TEST_USER'] ?? '',
      );
}


class ApiDataSource {
  final AuthBaseModel? _authBaseModel;

  // ApiDataSource(@factoryParam this._authBaseModel){
  //   _init();
  // }

  ApiDataSource(this._authBaseModel){
    _init();
  }

  late final Swagger api;


  void _init() {
    final client = ChopperClient(
      baseUrl: dotenv.env['API_URL']!,
      converter: CommonJsonSerializableConverter(),
      interceptors: [
        LoggerInterceptor(),
        AuthApiInterceptor(_authBaseModel),
      ],
    );
    api = Swagger.create(client);
  }


  static final commonJsonDecoder = CommonJsonDecoder(generatedMapping);
}
```

https://github.com/ZavbakGit/app_anit_flutter


