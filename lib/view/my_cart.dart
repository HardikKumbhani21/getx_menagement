import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_menagement/controllers/my_cart_controller.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCartController myCartController = Get.find<MyCartController>();
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: GetBuilder<MyCartController>(
          builder: (MyCartController controller) {
            return ListView.builder(
              itemCount: controller.myCartList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                      height: 40,
                      width: 50,
                      child: Image.network(controller.myCartList[index].image)),
                  title: Text("\$${controller.myCartList[index].price}"),
                  subtitle: Text("${controller.myCartList[index].title}"),
                  trailing: IconButton(
                    onPressed: () {
                      controller.removeproduct(controller.myCartList[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          },
        ));
  }
}
