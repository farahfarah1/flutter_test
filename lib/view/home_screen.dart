import 'package:flutter/material.dart';
import 'package:flutter_test_1/controller/home_controller.dart';
import 'package:flutter_test_1/utils/custom_card.dart';
import 'package:flutter_test_1/view/search.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Test'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: homeController.obx(
            (state) => ListView.builder(
                itemCount: state!.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                      id: state[index].id!,
                      email: state[index].email!,
                      phone: state[index].phone!);
                }),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            onEmpty: const Center(
              child: Text("No Users Found"),
            )));
  }
}
