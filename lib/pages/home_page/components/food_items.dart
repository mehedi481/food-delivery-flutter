import 'package:flutter/material.dart';
class FoodItems extends StatelessWidget {
  const FoodItems({ Key? key, required this.image, required this.imageName, required this.imagePrice }) : super(key: key);
  final String image;
  final String imageName;
  final int imagePrice;
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 220,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff3a3e3e),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 50,
                ),
                ListTile(
                  leading: Text(
                    imageName,
                    style: TextStyle(color: Colors.white, fontSize:18),
                  ),
                  trailing: Text(
                    "\$ $imagePrice",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}