import 'package:tubes_abp/model/burger_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = BurgerModel();

  burgerModel.name = "Cheese Burger";
  burgerModel.image = "images/cheeseBurger.png";
  burgerModel.price = "15";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Premium Burger";
  burgerModel.image = "images/doubleBeefBurger.png";
  burgerModel.price = "40";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Beef Burger";
  burgerModel.image = "images/beefBurger.png";
  burgerModel.price = "25";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  burgerModel.name = "Chicken Burger";
  burgerModel.image = "images/chickenBurger.png";
  burgerModel.price = "20";
  burger.add(burgerModel);
  burgerModel = BurgerModel();

  return burger;
}
