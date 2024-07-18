import '../Models/Product_Model.dart';

class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productList;
  ProductLoadedState(this.productList);

  List<ProductModel> getList() {
    List<ProductModel> products = [];
    for (var i = 0; i < productList.length; i++) {
      products.add(productList[i]);
    }
    return products;
  }
}

class ProductFailureState extends ProductState {}
