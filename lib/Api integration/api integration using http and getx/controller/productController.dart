
import 'package:get/get.dart';
import '../Services/httpservice.dart';

class ProductController extends GetxController{
  var isLoading = true.obs; // here isloading is now in observable state
  var productList = [].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async{
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }

    }catch(e){
        print(e);

      }finally{
      isLoading(false);
    }
    }
  }

