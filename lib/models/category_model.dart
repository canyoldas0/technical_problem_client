class CategoryModel {
  final int id;
  final String name;

  CategoryModel(this.id, this.name);
}

class Constants {
  static var production = CategoryModel(1, "Production");
  static var quality = CategoryModel(2, "Quality");
  static var maintenance = CategoryModel(3, "Maintenance");
}
