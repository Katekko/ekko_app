import 'package:ekko/infrastructure/dal/services/data/user.data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserModel {
  final String name, email;
  const UserModel({required this.name, required this.email});

  factory UserModel.fromData(UserData data) {
    return UserModel(name: data.name, email: data.email);
  }

  static UserModel? fromStorage() {
    final storage = Get.find<GetStorage>();
    final user = storage.read<UserModel>('user');
    return user;
  }

  Future<void> save() async {
    final storage = Get.find<GetStorage>();
    await storage.write('user', {'name': name, 'email': email});
  }
}
