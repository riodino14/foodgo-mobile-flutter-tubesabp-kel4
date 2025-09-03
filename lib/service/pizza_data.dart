import 'package:tubes_abp/model/pizza_model.dart';

List<PizzaModel> getPizza() {
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = PizzaModel();

  //1
  pizzaModel.image = "images/cheesePizza.png";
  pizzaModel.name = "Cheese Pizza";
  pizzaModel.price = "30";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.image = "images/regularPizza.png";
  pizzaModel.name = "Regular Pizza";
  pizzaModel.price = "25";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.image = "images/mushroomPizza.png";
  pizzaModel.name = "Mushroom Pizza";
  pizzaModel.price = "30";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();

  pizzaModel.image = "images/pepperoniPizza.png";
  pizzaModel.name = "Pepperoni Pizza";
  pizzaModel.price = "35";
  pizza.add(pizzaModel);
  pizzaModel = PizzaModel();
  return pizza;
}
