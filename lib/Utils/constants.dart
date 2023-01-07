import 'package:flutter/material.dart';

import '../models/category_model.dart';

class Constants {
  static var production = CategoryModel(1, "Production");
  static var quality = CategoryModel(2, "Quality");
  static var maintenance = CategoryModel(3, "Maintenance");
  static const appName = "Technical Problem";
}
