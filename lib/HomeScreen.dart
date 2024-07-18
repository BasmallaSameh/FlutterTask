import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Comp.dart';
import 'package:project/Cubit/Cubit.dart';
import 'package:project/Cubit/Get_States.dart';
import 'package:project/Models/Product_Model.dart';
import 'package:project/services/get_Prouducts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //List<ProductModel> products = GetProductCubit().productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Route",
          style: TextStyle(
            color: Color(0xff003D88),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetProductCubit(ProductService(dio: Dio())),
        child: BlocBuilder<GetProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, top: 10, left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 320,
                            height: 55,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "what do you search for? ",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xff003D88),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                    color: Color(0xff003D88),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 23.0),
                            child: Icon(
                              Icons.shopping_cart_sharp,
                              color: Color(0xff003D88),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Cards(product: state.productList[index]);
                      },
                      childCount: state.productList.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of columns
                      childAspectRatio: 200 / 340, // weight to height ratio
                      mainAxisSpacing: 10, // the same but on y axis
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('Failed to load products.'));
            }
          },
        ),
      ),
    );
  }
}
