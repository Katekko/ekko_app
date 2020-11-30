abstract class BaseData<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
