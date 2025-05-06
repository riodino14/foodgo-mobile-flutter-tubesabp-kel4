import 'package:tubes_abp/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = new PizzaModel();

  //1
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.name = "Cheese Pizza";
  pizzaModel.price = "50";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.image = "images/pizza2.png";
  pizzaModel.name = "Margherita Pizza";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.image = "images/pizza2.png";
  pizzaModel.name = "Margherita Pizza";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.image = "images/pizza2.png";
  pizzaModel.name = "Margherita Pizza";
  pizzaModel.price = "80";
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();
  return pizza;
}
