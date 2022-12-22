class CategoryModel{
  final int id;
  final String income_type;
  final String icon;
  final String color;

  CategoryModel({
     required this.id,
     required this.income_type,
     required this.icon,
     required this.color
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
        id: json['id'], 
        income_type: json['income_type'], 
        icon: json['icon'], 
        color: json['color']);
  }
}