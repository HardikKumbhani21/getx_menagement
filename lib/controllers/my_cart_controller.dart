import 'package:get/get.dart';
import 'package:getx_menagement/api_services/prodects_api_services.dart';

import '../model/product_model.dart';

class MyCartController extends GetxController {
  final List<ProductModel> _myCartList = [];

  List<ProductModel> get myCartList => _myCartList;
  late List<ProductModel> productList;
  bool apiloder = true;

  @override
  void onInit() {
    getProductApi().then((value) {
      productList = productModelFromJson(value);
      apiloder = false;
    });
    super.onInit();
  }

  void addproduct(ProductModel value) {
    _myCartList.add(value);
    update();
  }

  void removeproduct(ProductModel value) {
    _myCartList.remove(value);
    update();
  }

  bool isExist(ProductModel value) {
    return _myCartList.contains(value);
  }
}
