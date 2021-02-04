// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

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
        "lastPropertyId": "3:4497255579484860231",
        "name": "UserDao",
        "properties": [
          {"id": "1:8861018456016937789", "name": "id", "type": 6, "flags": 1},
          {"id": "2:898596441690418681", "name": "name", "type": 9},
          {"id": "3:4497255579484860231", "name": "email", "type": 9}
        ],
        "relations": [],
        "backlinks": []
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
        final offsetname =
            object.name == null ? null : fbb.writeString(object.name);
        final offsetemail =
            object.email == null ? null : fbb.writeString(object.email);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetname);
        fbb.addOffset(2, offsetemail);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = UserDao();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.name = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.email = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        return object;
      });

  return ModelDefinition(model, bindings);
}

class UserDao_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final email =
      QueryStringProperty(entityId: 1, propertyId: 3, obxType: 9);
}
