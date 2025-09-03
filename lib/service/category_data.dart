import 'package:tubes_abp/model/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.image = "images/burger.png";
  categoryModel.name = "Burger";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //2
  categoryModel.image = "images/pizza.png";
  categoryModel.name = "Pizza";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //3
  categoryModel.image = "images/kebab.png";
  categoryModel.name = "Kebab";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //4
  categoryModel.image = "images/snack.png";
  categoryModel.name = "Snack";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
