import 'package:dio_app/data/models/categories.dart';
import 'package:dio_app/screen/facebook_page/youtube_page.dart';
import 'package:dio_app/screen/google/google_page.dart';
import 'package:dio_app/screen/info_page.dart';
import 'package:dio_app/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 String word = '';
 bool isTrue = true;
 int Id = 1;
 bool isFalse = false;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        
        appBar: AppBar(title: Text("Category Page"),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> FaceBookPage()));
              },
              child: Image.asset('assets/images/youtube.png',width: 40,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> GooglPage()));
              },
              child: Image.asset('assets/images/google.png',width: 40,)),
          )
        ],
       
        
        ),
        
        body: Consumer<CategoryViewModel>(
          builder: (context, categoryViewModel, child){
            context.read<CategoryViewModel>().fetchAlbum();
             if (categoryViewModel.errorForUiOne.isNotEmpty) {
                return Center(
                  child: Text(categoryViewModel.errorForUiOne),
                );
              }
            if(categoryViewModel.categoryModel == null){
              return Center(child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                color: Colors.white,
    
              ));
             
            }
            return
              SingleChildScrollView(
                child:
                    Column(
                      children: [
                        
                        ExpansionTile(
                        onExpansionChanged: (value) {
                          isTrue = !value;
                          word = '';
                          isFalse = false;
                        },  
                        title: Text('Search Categories'),
                        trailing: Icon(Icons.screen_search_desktop_outlined),
                        children: [
                          Padding(
                                        padding:  EdgeInsets.all(12),
                                        child: TextFormField(
                                          onSaved: (newValue) {
                                            isFalse = !isFalse;
                                          },
                                          
                                           onChanged: (value) {
                                            word = value;
                                            

                                           },
                                            textInputAction: TextInputAction.done,
                                            textCapitalization: TextCapitalization.characters,
                                                   
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                            decoration: InputDecoration(
                                              prefixIcon: IconButton(onPressed: (){
                                                isFalse = !isFalse;
                                              }, icon: Icon(Icons.search)),
                                              hintText: 'Search',
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(width: 1, color: Colors.black)),
                                              focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(width: 1, color: Colors.black)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(width: 1, color: Colors.black)),
                                            ),
                                          ),
                                      )
                          ]),
                       isTrue? Container(
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: categoryViewModel.categoryModel!.length,
                          itemBuilder: (BuildContext context, int index) { 
                            if(word == categoryViewModel.categoryModel![index].name)
                              Id = categoryViewModel.categoryModel![index].id;
                            
                            return isTrue? ListTile(
                            onTap: () {
                              Provider.of<CategoryViewModel>(context, listen: false).fetchProduct(categoryViewModel.categoryModel![index].id);
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>InfoPape()));
                            },
                            trailing: Image.network(categoryViewModel.categoryModel![index].image_url),  
                            title: Text(categoryViewModel.categoryModel![index].name),
                            subtitle: Text(categoryViewModel.categoryModel![index].created_at),
                          
                            leading: Text(categoryViewModel.categoryModel![index].id.toString()),
                          ):ListTile(
                            onTap: () {
                              Provider.of<CategoryViewModel>(context, listen: false).fetchProduct(categoryViewModel.categoryModel![index].id);
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>InfoPape()));
                            },
                            trailing: Image.network(categoryViewModel.categoryModel![Id].image_url),  
                            title: Text(categoryViewModel.categoryModel![Id].name),
                            subtitle: Text(categoryViewModel.categoryModel![Id].created_at),
                          
                            leading: Text(categoryViewModel.categoryModel![Id].id.toString()),
                          );
                           },
                          
                        )
                          
                          
                      
                      
                      
                        
                              ): isFalse? Container(
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) { 
                            if(word == categoryViewModel.categoryModel![index].name)
                              Id = categoryViewModel.categoryModel![index].id-1;
                            
                            return ListTile(
                            onTap: () {
                              Provider.of<CategoryViewModel>(context, listen: false).fetchProduct(categoryViewModel.categoryModel![index].id);
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>InfoPape()));
                            },
                            trailing: Image.network(categoryViewModel.categoryModel![Id].image_url),  
                            title: Text(categoryViewModel.categoryModel![Id].name),
                            subtitle: Text(categoryViewModel.categoryModel![Id].created_at),
                          
                            leading: Text(categoryViewModel.categoryModel![Id].id.toString()),
                          );
                           },
                          
                        )
                          
                          
                      
                      
                      
                        
                              ):Container(),
                           

                      ],
                    ), 
                  
               
              );
          },
        ),
      ),
    );
  }

  
}