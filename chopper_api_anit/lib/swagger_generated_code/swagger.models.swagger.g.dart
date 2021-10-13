// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    code: json['code'] as int?,
    description: json['description'] as String? ?? '',
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('description', instance.description);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    guid: json['guid'] as String? ?? '',
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    baseAuthString: json['base_auth_string'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('base_auth_string', instance.baseAuthString);
  return val;
}

CatalogItem _$CatalogItemFromJson(Map<String, dynamic> json) {
  return CatalogItem(
    guid: json['guid'] as String? ?? '',
    code: json['code'] as String? ?? '',
    name: json['name'] as String? ?? '',
    markDeletion: json['mark_deletion'] as bool?,
  );
}

Map<String, dynamic> _$CatalogItemToJson(CatalogItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('guid', instance.guid);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('mark_deletion', instance.markDeletion);
  return val;
}

CatalogItemArray _$CatalogItemArrayFromJson(Map<String, dynamic> json) {
  return CatalogItemArray();
}

Map<String, dynamic> _$CatalogItemArrayToJson(CatalogItemArray instance) =>
    <String, dynamic>{};
