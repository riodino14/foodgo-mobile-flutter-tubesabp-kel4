import 'package:tubes_abp/model/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.image = "images/burger.png";
  categoryModel.name = "Burger";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel.image = "images/pizza.png";
  categoryModel.name = "Pizza";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //3
  categoryModel.image = "images/Chinese.png";
  categoryModel.name = "Chinese";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //4
  categoryModel.image = "images/tacos.png";
  categoryModel.name = "Mexican";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
