import 'package:tubes_abp/model/kebab_model.dart';

List<KebabModel> getKebab() {
  List<KebabModel> kebab = [];
  KebabModel kebabModel = KebabModel();

  //1
  kebabModel.image = "images/chickenKebab.png";
  kebabModel.name = "Chicken Kebab";
  kebabModel.price = "20";
  kebab.add(kebabModel);
  kebabModel = KebabModel();

  kebabModel.image = "images/beefKebab.png";
  kebabModel.name = "Beef Kebab";
  kebabModel.price = "25";
  kebab.add(kebabModel);
  kebabModel = KebabModel();

  kebabModel.image = "images/shawarmaKebab.png";
  kebabModel.name = "Shawarma Kebab";
  kebabModel.price = "28";
  kebab.add(kebabModel);
  kebabModel = KebabModel();

  kebabModel.image = "images/kebabJumbo.png";
  kebabModel.name = "Kebab Jumbo";
  kebabModel.price = "35";
  kebab.add(kebabModel);
  kebabModel = KebabModel();

  return kebab;
}