import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'swagger.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Error {
  Error({
    this.code,
    this.description,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @JsonKey(name: 'code', includeIfNull: false)
  final int? code;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  static const fromJsonFactory = _$ErrorFromJson;
  static const toJsonFactory = _$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $ErrorExtension on Error {
  Error copyWith({int? code, String? description}) {
    return Error(
        code: code ?? this.code, description: description ?? this.description);
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
    this.guid,
    this.code,
    this.name,
    this.baseAuthString,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false, defaultValue: '')
  final String? guid;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'base_auth_string', includeIfNull: false, defaultValue: '')
  final String? baseAuthString;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.baseAuthString, baseAuthString) ||
                const DeepCollectionEquality()
                    .equals(other.baseAuthString, baseAuthString)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(baseAuthString) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {String? guid, String? code, String? name, String? baseAuthString}) {
    return User(
        guid: guid ?? this.guid,
        code: code ?? this.code,
        name: name ?? this.name,
        baseAuthString: baseAuthString ?? this.baseAuthString);
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogItem {
  CatalogItem({
    this.guid,
    this.code,
    this.name,
    this.markDeletion,
  });

  factory CatalogItem.fromJson(Map<String, dynamic> json) =>
      _$CatalogItemFromJson(json);

  @JsonKey(name: 'guid', includeIfNull: false, defaultValue: '')
  final String? guid;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'mark_deletion', includeIfNull: false)
  final bool? markDeletion;
  static const fromJsonFactory = _$CatalogItemFromJson;
  static const toJsonFactory = _$CatalogItemToJson;
  Map<String, dynamic> toJson() => _$CatalogItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CatalogItem &&
            (identical(other.guid, guid) ||
                const DeepCollectionEquality().equals(other.guid, guid)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.markDeletion, markDeletion) ||
                const DeepCollectionEquality()
                    .equals(other.markDeletion, markDeletion)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(guid) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(markDeletion) ^
      runtimeType.hashCode;
}

extension $CatalogItemExtension on CatalogItem {
  CatalogItem copyWith(
      {String? guid, String? code, String? name, bool? markDeletion}) {
    return CatalogItem(
        guid: guid ?? this.guid,
        code: code ?? this.code,
        name: name ?? this.name,
        markDeletion: markDeletion ?? this.markDeletion);
  }
}

@JsonSerializable(explicitToJson: true)
class CatalogItemArray {
  CatalogItemArray();

  factory CatalogItemArray.fromJson(Map<String, dynamic> json) =>
      _$CatalogItemArrayFromJson(json);

  static const fromJsonFactory = _$CatalogItemArrayFromJson;
  static const toJsonFactory = _$CatalogItemArrayToJson;
  Map<String, dynamic> toJson() => _$CatalogItemArrayToJson(this);

  @override
  int get hashCode => runtimeType.hashCode;
}
