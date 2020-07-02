import 'package:arctekko/domain/todo/models/category.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  TodoDomainService _todoDomainService;
  AddTodoController(
    TodoDomainService todoDomainService, {
    Map screenArgs,
  }) {
    _todoDomainService = todoDomainService;
  }

  @override
  void onInit() async {
    super.onInit();
    var response = await _todoDomainService.fetchCategories();
    categories.addAll(response);
    onChangeCategory(response.first);
  }

  final _title = ''.obs;
  String get title => _title.value;
  void onChangeTitle(String val) => _title.value = val;

  final _desc = ''.obs;
  String get description => _desc.value;
  void onChangeDescription(String val) => _desc.value = val;

  final categories = <CategoryModel>[].obs;
  final _currentCategory = Rx<CategoryModel>();
  CategoryModel get currentCategory => _currentCategory.value;
  void onChangeCategory(CategoryModel val) => _currentCategory.value = val;
}
