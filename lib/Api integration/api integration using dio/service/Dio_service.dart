import 'package:dio/dio.dart';


class DioService{
  Future<dynamic> getMethode(String url)async{
    Dio dio = Dio();
    return await dio.get(url,options:Options(responseType: ResponseType.json,method: "Get")).
    then((response){
      return response;
    });

  }
}