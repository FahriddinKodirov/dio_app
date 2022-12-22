import 'dart:async';
import 'package:dio_app/data/api_service/api_service.dart';
import 'package:dio_app/data/models/album.dart';
import 'package:dio_app/data/models/categories.dart';
import 'package:dio_app/data/models/products_model.dart';
import 'package:dio_app/data/repository/products_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class CategoryViewModel extends ChangeNotifier{

  CategoryViewModel({required this.categoryRepo});

  List<CategoryModel>? categoryModel;

  

  CategoryRepo categoryRepo;
  String errorForUiOne = '';


  fetchAlbum() async{
  MyResponse myResponse = await categoryRepo.getMyCategory();
   
   if(myResponse.error.isEmpty) {
      categoryModel = myResponse.data;
    } else {
      errorForUiOne = myResponse.error;
    }

  notifyListeners();
  }
//!-----------------------------------

List<ProductsModel>? productsModel;
String errorForUiTwo = '';

  fetchProduct(int id) async {
    MyResponse myResponse = await categoryRepo.getMyProducts(id);

    if(myResponse.error.isEmpty) {
      productsModel = myResponse.data;
    } else {
      errorForUiTwo = myResponse.error;
    }
  notifyListeners();
  }



}

