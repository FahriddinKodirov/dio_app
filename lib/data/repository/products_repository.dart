

import 'package:dio_app/data/api_service/api_service.dart';
import 'package:dio_app/data/models/album.dart';
import 'package:dio_app/data/models/categories.dart';
import 'package:dio_app/data/models/products_model.dart';

class CategoryRepo{
  CategoryRepo( {required this.apiService});

  ApiService apiService;

  Future<MyResponse> getMyCategory ()=> apiService.getAllCategory();
  Future<MyResponse> getMyProducts (int id)=> apiService.getAllProducts(id);


}