import 'package:flutter/material.dart';
import 'package:flutter_test_1/controller/home_controller.dart';

import 'package:flutter_test_1/utils/custom_card.dart';
import 'package:get/get.dart';

class SearchUser extends SearchDelegate {
  final homeController = Get.find<HomeController>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetX<HomeController>(
        initState: (state) => state.controller!.searchUser(query),
        builder: (snapshot) {
          if (snapshot.searchUsers.isEmpty) {
            return const Center(
              child: Text("No Users Found"),
            );
          }
          return ListView.builder(
              itemCount: snapshot.searchUsers.length,
              itemBuilder: (context, index) {
                return CustomCard(
                    id: snapshot.searchUsers[index].id!,
                    email: snapshot.searchUsers[index].email!,
                    phone: snapshot.searchUsers[index].phone!);
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search User by Name or Id'),
    );
  }
}
