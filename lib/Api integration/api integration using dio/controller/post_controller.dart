import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../model/post_model.dart';
import '../service/Dio_service.dart';

class Post_Controller extends GetxController{
  RxList post = RxList(); // the list post is observable and empty (initially)
  RxBool isLoading = true.obs;

  RxBool isListScrollDown = false.obs;
  RxBool isInternetConnected = true.obs;

  var url ="https://jsonplaceholder.typicode.com/posts";
  // to perform scroll action animations etc on scrollable positioned list
  var itemsController = ItemScrollController();

  //for checking internet connection
  checkIfInternetConnected() async{
   isInternetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  //call api and get response
  getposts()async{
    checkIfInternetConnected();
    isLoading.value =true;
    var response = await DioService().getMethode(url);
    if(response.statuscode == 200){
     response.data.forEach((element){
       post.add(PostModel.fromJson(element));
     });
     isLoading.value = false;
    }
  }

  //scroll listview to down
  ScrolltoDown(){
    itemsController.scrollTo(index: post.length -5, duration: Duration(
      seconds: 2,),
      curve :  Curves.linearToEaseOut);
    isListScrollDown.value = true;
  }
  // scroll listview to top
  ScrolltoUp(){
    itemsController.scrollTo(index: 0, duration: Duration(
      seconds: 2,),
      curve: Curves.bounceIn);
    isListScrollDown.value = false;
  }
  @override
  void onInit(){
    getposts();
    isInternetConnected();
    super.onInit();
  }
}