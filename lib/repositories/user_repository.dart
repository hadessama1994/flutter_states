import 'package:dio/dio.dart';
import 'package:flutter_json/models/user_model.dart';

class UserRepository {
  final dio = Dio();
  final url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> fetchUsers() async {
    final response = await dio.get(url);
    final userList = response.data as List;
    List<UserModel> users = [];

    for (var json in userList) {
      final user = UserModel.fromJson(json);
      users.add(user);
    }
    return users;
  }
}
