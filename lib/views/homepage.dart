import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_api_demo/controllers/product_controller.dart';
import 'package:getx_api_demo/views/product_tile.dart';

class Homepage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'shopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                )),
                IconButton(
                    onPressed: (() {}), icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: (() {}), icon: Icon(Icons.grid_view)),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isloding.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
