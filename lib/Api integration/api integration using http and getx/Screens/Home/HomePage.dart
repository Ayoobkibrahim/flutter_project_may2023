import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Api%20integration/api%20integration%20using%20http%20and%20getx/controller/productController.dart';
import 'package:get/get.dart';
import 'Widgets/productTile.dart';

void main(){
  runApp(GetMaterialApp(home: ApiHomePage(),debugShowCheckedModeBanner: false,));
}
class ApiHomePage extends StatelessWidget {
  final productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products from Api"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productController.isLoading.value){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context,index){
                  return ProductTile(productController.productList[index]);
                },
            itemCount: productController.productList.length,
            );
          }
        }),
      ),
    );
  }
}
