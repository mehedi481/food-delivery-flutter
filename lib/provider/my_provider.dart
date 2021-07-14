import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/model/categories_model.dart';

class MyProvider with ChangeNotifier {
  List<CategoriesModel> burgerCategoriesList = [];
  List<CategoriesModel> pizzaCategoriesList = [];
  List<CategoriesModel> kababCategoriesList = [];
  List<CategoriesModel> drinkCategoriesList = [];

  late CategoriesModel burgerModel;
  late CategoriesModel pizzaModel;
  late CategoriesModel kababModel;
  late CategoriesModel drinkModel;

  //Getting the Lists
  get getBurgerList => burgerCategoriesList;
  get getPizzaList => pizzaCategoriesList;
  get getkababList => kababCategoriesList;
  get getDrinkList => drinkCategoriesList;

  ////////////////////Burger List////////////////////
  Future<void> getBurgerCategories() async {
    List<CategoriesModel> newCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("HSVVzJeBcCNRVjCvzJhQ")
        .collection("Burger")
        .get();

    querySnapshot.docs.forEach((element) {
      burgerModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );

      print(burgerModel.name);

      newCategoriesList.add(burgerModel);
      burgerCategoriesList = newCategoriesList;
    });
  }

  ////////////////////Pizza List////////////////////
  Future<void> getPizzaCategories() async {
    List<CategoriesModel> newCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("HSVVzJeBcCNRVjCvzJhQ")
        .collection("Pizza")
        .get();

    querySnapshot.docs.forEach((element) {
      pizzaModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );

      print(pizzaModel.name);

      newCategoriesList.add(pizzaModel);
      pizzaCategoriesList = newCategoriesList;
    });
  }

  // ////////////////////Kabab List////////////////////
  Future<void> getKababCategories() async {
    List<CategoriesModel> newCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("HSVVzJeBcCNRVjCvzJhQ")
        .collection("Kabab")
        .get();

    querySnapshot.docs.forEach((element) {
      kababModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );

      print(kababModel.name);

      newCategoriesList.add(kababModel);
      kababCategoriesList = newCategoriesList;
    });
  }

  // ////////////////////Drink List////////////////////
  Future<void> getDrinkCategories() async {
    try {
      List<CategoriesModel> newCategoriesList = [];
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("categories")
          .doc("HSVVzJeBcCNRVjCvzJhQ")
          .collection("Drinks")
          .get();

      querySnapshot.docs.forEach((element) {
        drinkModel = CategoriesModel(
          name: element['name'],
          image: element['image'],
        );

        print(drinkModel.name);

        newCategoriesList.add(drinkModel);
        drinkCategoriesList = newCategoriesList;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
