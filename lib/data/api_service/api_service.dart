import 'package:dio/dio.dart';
import 'package:dio_app/data/api_service/api_client.dart';
import 'package:dio_app/data/models/album.dart';
import 'package:dio_app/data/models/categories.dart';
import 'package:dio_app/data/models/products_model.dart';

class MyResponse{
  MyResponse({
              this.data,
              required this.error});

  dynamic data;
  String error = '';
}

class ApiService  extends ApiClient{

//!------------------------- Client dio -----------------------------------------------------
   Future<MyResponse> getAllProducts(int id) async {

      MyResponse myResponse = MyResponse(error: '');

    try{
      Response response = await dio.get("${dio.options.baseUrl}/categories/${id}");
      if(response.statusCode == 200){
        myResponse.data = (response.data as List?)?.map((e) => ProductsModel.fromJson(e)).toList()??[];
      }
    } catch (err){
      myResponse.error = err.toString();
    }
    return myResponse;
  }
//!------------------------ Dio ----------------------------------------------------------
  Future<MyResponse> getAllCategory()async{
   Dio dio = Dio();

    MyResponse myResponse = MyResponse(error: '');
    try{
      Response response = await dio.get("https://third-exam.free.mockoapp.net/categories");
      if(response.statusCode == 200){
        myResponse.data = (response.data as List?)?.map((e) => CategoryModel.fromJson(e)).toList()??[];
      }
    } catch (err){
      myResponse.error = err.toString();
    }
    return myResponse;
  }

}