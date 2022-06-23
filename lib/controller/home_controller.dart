import 'package:flutter_test_1/model/user.dart';
import 'package:flutter_test_1/service/api_service.dart';

import 'package:get/state_manager.dart';

class HomeController extends GetxController with StateMixin<List<User>> {
  late final List<User> users = [];
  late final searchUsers = RxList<User>();
  final FetchUser _userList = FetchUser();
  @override
  void onInit() async {
    try {
      final users = await _userList.getuserList();

      if (users.isEmpty) {
        change(users, status: RxStatus.empty());
      } else {
        change(users, status: RxStatus.success());
      }
    } catch (e) {
      change(users, status: RxStatus.error());
    }

    super.onInit();
  }

  searchUser(String query) async {
    searchUsers.value = [];
    try {
      final users = await _userList.getuserList(query: query);

      if (users.isNotEmpty) {
        searchUsers.value = users;
      }
    } catch (e) {
      print(e);
    }
  }
}
