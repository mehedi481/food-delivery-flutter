import 'package:flutter/material.dart';
import 'package:food_delivery/helper/image_path.dart';
import 'package:food_delivery/pages/home_page/components/categories_food_items.dart';
import 'package:food_delivery/pages/home_page/components/food_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(backgroundImage: AssetImage(ImagePath.person)),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xff3a3e3e),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoriesFoodItems(
                      image: ImagePath.allFood,
                      imageName: "All",
                    ),
                    CategoriesFoodItems(
                      image: ImagePath.food_1,
                      imageName: "Pizza",
                    ),
                    CategoriesFoodItems(
                      image: ImagePath.food_2,
                      imageName: "Drinks",
                    ),
                    CategoriesFoodItems(
                      image: ImagePath.food_4,
                      imageName: "Brade",
                    ),
                    CategoriesFoodItems(
                      image: ImagePath.food_5,
                      imageName: "Kabab",
                    ),
                    CategoriesFoodItems(
                      image: ImagePath.food_3,
                      imageName: "Pasta",
                    ),
                  ],
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(), //Note:This is very important if Gridview inside of ListView
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                children: [
                  FoodItems(
                    image: ImagePath.food_1,
                    imageName: "Pizza",
                    imagePrice: 123,
                  ),
                  FoodItems(
                    image: ImagePath.food_1,
                    imageName: "Pizza",
                    imagePrice: 123,
                  ),
                  FoodItems(
                    image: ImagePath.food_1,
                    imageName: "Pizza",
                    imagePrice: 123,
                  ),
                  FoodItems(
                    image: ImagePath.food_1,
                    imageName: "Pizza",
                    imagePrice: 123,
                  ),
                ],
              ),
              Container(height: 250, child: Text("Mehedi"))
            ],
          ),
        ],
      ),
    );
  }
}
