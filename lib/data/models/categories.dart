class CategoryModel{
  final int id;
  final String name;
  final String image_url;
  final String created_at;

  CategoryModel({
     required this.id,
     required this.name,
     required this.image_url,
     required this.created_at
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
        id: json['id'], 
        name: json['name'], 
        image_url: json['image_url'], 
        created_at: json['created_at']);
  }
}