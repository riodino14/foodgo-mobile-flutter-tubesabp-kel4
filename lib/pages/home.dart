import 'package:flutter/material.dart';
import 'package:tubes_abp/model/burger_model.dart';
import 'package:tubes_abp/model/pizza_model.dart';
import 'package:tubes_abp/pages/detail_page.dart';
import 'package:tubes_abp/service/pizza_data.dart';
import 'package:tubes_abp/service/widget_support.dart';
import 'package:tubes_abp/model/category_model.dart';
import 'package:tubes_abp/service/category_data.dart';
import 'package:tubes_abp/service/burger_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> burger = [];
  List<BurgerModel> pizza = [];
  String track = "0";

  @override
  void initState() {
    super.initState();
    categories = getCategory();
    pizza = getBurger();
    burger = getPizza();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 50,
                      width: 110,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order Your Favorite Food",
                      style: AppWidget.SimpleLineTextFieldStyle(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/Faiq.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search your favorite food",
                        hintStyle: AppWidget.SimpleLineTextFieldStyle(),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categories[index].name!,
                    categories[index].image!,
                    index.toString(),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            track == "0"
                ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: pizza.length,
                      itemBuilder: (context, index) {
                        return FoodTile(
                          pizza[index].name!,
                          pizza[index].image!,
                          pizza[index].price!,
                        );
                      },
                    ),
                  ),
                )
                : track == "1"
                ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: burger.length,
                      itemBuilder: (context, index) {
                        return FoodTile(
                          burger[index].name!,
                          burger[index].image!,
                          burger[index].price!,
                        );
                      },
                    ),
                  ),
                )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Text(name, style: AppWidget.boldTextFieldStyle()),
          Text("\$$price", style: AppWidget.priceTextFieldStyle()),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailPage(
                            image: image,
                            name: name,
                            price: price,
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child:
          track == categoryindex
              ? Container(
                margin: EdgeInsets.only(right: 20, bottom: 10),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          image,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Text(name, style: AppWidget.WhiteTextFieldStyle()),
                      ],
                    ),
                  ),
                ),
              )
              : Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text(name, style: AppWidget.SimpleLineTextFieldStyle()),
                  ],
                ),
              ),
    );
  }
}
