import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/request_tile.dart';
import 'package:tom/controllers/request_controller.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequestController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primary,
          title: Text(
            'Requests',
            style: TextStyle(color: MyColors.white),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.filteredRequests.length,
            itemBuilder: (context, int index) {
              return RequestTile(controller.filteredRequests[index]);
            },
          ),
        ));
  }
}
