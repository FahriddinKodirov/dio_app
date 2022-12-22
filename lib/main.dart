import 'package:dio_app/data/api_service/api_service.dart';
import 'package:dio_app/data/repository/products_repository.dart';
import 'package:dio_app/screen/my_home_page.dart';
import 'package:dio_app/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)=>CategoryViewModel(categoryRepo: CategoryRepo(apiService: ApiService())),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
