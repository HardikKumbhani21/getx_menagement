import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_menagement/controllers/internet_check_controller.dart';
import 'package:getx_menagement/controllers/my_cart_controller.dart';
import 'my_cart.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCartController myCartController = Get.put(MyCartController());
    InternetCheckController internetCheckController =
        Get.put(InternetCheckController());
    return Scaffold(
        appBar: AppBar(title: Text("Products"), actions: [
          IconButton(
              onPressed: () {
                Get.to(MyCart());
              },
              icon: Icon(Icons.shopping_cart))
        ]),
        body: GetBuilder<InternetCheckController>(
          builder: (InternetCheckController controller) {
            if (!controller.internetCheckLoder) {
              return Material();
            } else {
              if (controller.internet) {
                return GetBuilder<MyCartController>(
                  builder: (MyCartController controller) {
                    if (controller.apiloder) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: SizedBox(
                                  height: 40,
                                  width: 50,
                                  child: Image.network(
                                      controller.productList[index].image)),
                              title: Text(
                                  "\$${controller.productList[index].price}"),
                              subtitle: Text(
                                  "${controller.productList[index].title}"),
                              trailing: IconButton(
                                onPressed: () {
                                  if (controller
                                      .isExist(controller.productList[index])) {
                                    controller.removeproduct(
                                        controller.productList[index]);
                                  } else {
                                    controller.addproduct(
                                        controller.productList[index]);
                                  }
                                },
                                icon: (controller
                                        .isExist(controller.productList[index]))
                                    ? Icon(Icons.shopping_cart)
                                    : Icon(Icons.shopping_cart_outlined),
                              ),
                            );
                          },
                          itemCount: controller.productList.length);
                    }
                  },
                );
              } else {
                return Material(
                  child: Center(child: Text("No Internet")),
                );
              }
            }
          },
        ));
  }
}
