import 'package:dio_app/data/models/categories.dart';
import 'package:dio_app/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class InfoPape extends StatefulWidget {
  const InfoPape({super.key});

  @override
  State<InfoPape> createState() => _InfoPapeState();
}

class _InfoPapeState extends State<InfoPape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page"),),
      body: Consumer<CategoryViewModel>(
        builder: (context, productsViewModel, child){
          if(productsViewModel.productsModel == null){
            return Center(child: CircularProgressIndicator());
          }
          if (productsViewModel.errorForUiTwo.isNotEmpty) {
              return Center(
                child: Text(productsViewModel.errorForUiTwo),
              );
            }
          
       return Container(
            child: ListView.builder(
              itemCount: productsViewModel.productsModel!.length,
              itemBuilder: (BuildContext context, int index) { 
                return ListTile(
                trailing: Image.network(productsViewModel.productsModel![index].image_url),  
                title: Text(productsViewModel.productsModel![index].name),
                subtitle: Text('price: ${productsViewModel.productsModel![index].price}\$'),
              
                leading: Text(productsViewModel.productsModel![index].id.toString()),
              );
               },
              
            )
              
              



            
          );
        },
      ),
    );
  }
}