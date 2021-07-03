import 'package:flutter/material.dart';

class CategoriesFoodItems extends StatelessWidget {
  const CategoriesFoodItems({ Key? key, this.image, this.imageName }) : super(key: key);
  final image;
  final imageName;
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left:10,right: 10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                imageName,
                style: TextStyle(color: Colors.white),
              )
            ],
          );
  }
}