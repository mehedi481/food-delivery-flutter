import 'package:flutter/material.dart';
import 'package:food_delivery/helper/image_path.dart';
import 'package:food_delivery/helper/keyboard.dart';
import 'package:food_delivery/model/categories_model.dart';
import 'package:food_delivery/pages/home_page/components/categories_food_items.dart';
import 'package:food_delivery/pages/home_page/components/drawer.dart';
import 'package:food_delivery/pages/home_page/components/food_items.dart';
import 'package:food_delivery/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> burgerList = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    provider.getCategories();
    burgerList = provider.getList;

    // Food item on the top level
    Widget burger() {
      return Row(
        children: burgerList
            .map((e) => CategoriesFoodItems(image: e.image, imageName: e.name))
            .toList(),
      );
    }

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(backgroundImage: AssetImage(ImagePath.person)),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Keyboard.hide(context);
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color(0xff3a3e3e),
                      filled: true,
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
                      burger()
                      // CategoriesFoodItems(
                      //   image: ImagePath.allFood,
                      //   imageName: "All",
                      // ),
                      // CategoriesFoodItems(
                      //   image: ImagePath.food_1,
                      //   imageName: "Pizza",
                      // ),
                      // CategoriesFoodItems(
                      //   image: ImagePath.food_2,
                      //   imageName: "Drinks",
                      // ),
                      // CategoriesFoodItems(
                      //   image: ImagePath.food_4,
                      //   imageName: "Brade",
                      // ),
                      // CategoriesFoodItems(
                      //   image: ImagePath.food_5,
                      //   imageName: "Kabab",
                      // ),
                      // CategoriesFoodItems(
                      //   image: ImagePath.food_3,
                      //   imageName: "Pasta",
                      // ),
                    ],
                  ),
                ),
                GridView.count(
                  physics:
                      ScrollPhysics(), //Note:This is very important if Gridview inside of ListView
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
                      image: ImagePath.food_2,
                      imageName: "Drinks",
                      imagePrice: 13,
                    ),
                    FoodItems(
                      image: ImagePath.food_4,
                      imageName: "Brade",
                      imagePrice: 23,
                    ),
                    FoodItems(
                      image: ImagePath.food_5,
                      imageName: "Kabab",
                      imagePrice: 12,
                    ),
                  ],
                ),
                Container(height: 50, child: Text("Mehedi")),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       CategoriesFoodItems(
                //         image: ImagePath.allFood,
                //         imageName: "All",
                //       ),
                //       CategoriesFoodItems(
                //         image: ImagePath.food_1,
                //         imageName: "Pizza",
                //       ),
                //       CategoriesFoodItems(
                //         image: ImagePath.food_2,
                //         imageName: "Drinks",
                //       ),
                //       CategoriesFoodItems(
                //         image: ImagePath.food_4,
                //         imageName: "Brade",
                //       ),
                //       CategoriesFoodItems(
                //         image: ImagePath.food_5,
                //         imageName: "Kabab",
                //       ),
                //       CategoriesFoodItems(
                //         image: ImagePath.food_3,
                //         imageName: "Pasta",
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
