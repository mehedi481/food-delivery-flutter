import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/model/categories_model.dart';

class MyProvider with ChangeNotifier {
  List<CategoriesModel> categoriesList = [];
  late CategoriesModel categoriesModel;

  //Getting the List 
  get getList => categoriesList;

  Future<void> getCategories() async {
    List<CategoriesModel> newCategoriesList =[];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("HSVVzJeBcCNRVjCvzJhQ")
        .collection("Burger")
        .get();

    querySnapshot.docs.forEach((element) {
      categoriesModel = CategoriesModel(
        name: element['name'],
        image: element['image'],
      );

      print(categoriesModel.name);

      newCategoriesList.add(categoriesModel);
      categoriesList = newCategoriesList;
    });
  }
  
}
