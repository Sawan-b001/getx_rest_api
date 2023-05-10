import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/Controllers/productlist_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
              ],
            ),
            Obx(() {
              if (productController.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Image.network(productController
                                        .productList[index].imageLink),
                                  ),
                                ],
                              ),
                              Text(productController.productList[index].name),
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                    child: Text(
                                  "${productController.productList[index].rating ?? " 0.0"}",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              Text(
                                productController.productList[index].price,
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1)),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
