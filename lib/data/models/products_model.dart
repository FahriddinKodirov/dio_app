class ProductsModel{
  final int id;
  final int category_id;
  final String name;
  final String image_url;
  final int price;
  final String description;

  ProductsModel({
     required this.id,
     required this.category_id,
     required this.name,
     required this.image_url,
     required this.price,
     required this.description
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json){
    return ProductsModel(
        id: json['id'], 
        name: json['name'], 
        image_url: json['image_url'], 
        description: json['description'],
        category_id: json['category_id'], 
        price: json['price'],
        
);
  }
}