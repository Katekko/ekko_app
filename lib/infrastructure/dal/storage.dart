import 'package:get_storage/get_storage.dart';

import '../../domain/core/abstractions/storage.interface.dart';

class Storage implements IStorage {
  final GetStorage _storage;
  const Storage({required GetStorage storage}) : _storage = storage;

  @override
  Future<T?> read<T>(String key) async {
    return _storage.read<T>(key);
  }

  @override
  Future<void> write({required String key, required value}) async {
    await _storage.write(key, value);
  }
}
