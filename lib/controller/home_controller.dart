import 'package:flutter/material.dart';
import 'package:flutter_json/models/user_model.dart';
import 'package:flutter_json/repositories/user_repository.dart';

class HomeController {
  List<UserModel> users = [];
  final repository = UserRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      users = await repository.fetchUsers();
      state.value = HomeState.done;
    } on Exception catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, done, error }
