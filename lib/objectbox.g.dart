// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes
// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'infrastructure/dal/daos/user.dao.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:1434198125164529165",
        "lastPropertyId": "7:3214568860903399095",
        "name": "UserDao",
        "properties": [
          {
            "id": "1:8861018456016937789",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int?"
          },
          {
            "id": "5:7739502241060260460",
            "name": "serverId",
            "type": 6,
            "dartFieldType": "int?"
          },
          {
            "id": "6:4908367951482217610",
            "name": "name",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "7:3214568860903399095",
            "name": "email",
            "type": 9,
            "dartFieldType": "String"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": [
          "name named",
          "email named",
          "id named",
          "serverId named"
        ],
        "nullSafetyEnabled": true
      }
    ],
    "lastEntityId": "1:1434198125164529165",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[UserDao] = EntityDefinition<UserDao>(
      model: model.getEntityByUid(1434198125164529165),
      toOneRelations: (UserDao object) => [],
      toManyRelations: (UserDao object) => {},
      getId: (UserDao object) => object.id,
      setId: (UserDao object, int id) {
        object.id = id;
      },
      objectToFB: (UserDao object, fb.Builder fbb) {
        final offsetname = fbb.writeString(object.name);
        final offsetemail = fbb.writeString(object.email);
        fbb.startTable(8);
        fbb.addInt64(0, object.id ?? 0);
        fbb.addInt64(4, object.serverId);
        fbb.addOffset(5, offsetname);
        fbb.addOffset(6, offsetemail);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = UserDao(
            name: fb.StringReader().vTableGet(buffer, rootOffset, 14, ''),
            email: fb.StringReader().vTableGet(buffer, rootOffset, 16, ''),
            id: fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4),
            serverId:
                fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12));

        return object;
      });

  return ModelDefinition(model, bindings);
}

class UserDao_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final serverId =
      QueryIntegerProperty(entityId: 1, propertyId: 5, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 1, propertyId: 6, obxType: 9);
  static final email =
      QueryStringProperty(entityId: 1, propertyId: 7, obxType: 9);
}
