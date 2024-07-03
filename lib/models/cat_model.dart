class CategoryModel {
  String name;
  String imagePath;

  CategoryModel({
    required this.name,
    required this.imagePath,
  });

  static List<CategoryModel> getcat() {
    return [
      CategoryModel(name: 'Grocies', imagePath: 'assets/images/category1.png'),
      CategoryModel(name: 'Fashion', imagePath: 'assets/images/category2.png'),
      CategoryModel(name: 'beauty', imagePath: 'assets/images/category3.png'),
      CategoryModel(name: 'Kitchen', imagePath: 'assets/images/category4.png'),
    ];
  }
}
