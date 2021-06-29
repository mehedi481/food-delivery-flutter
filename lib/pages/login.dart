import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myTextField(hintText: "Username", icon: Icons.person),
                    SizedBox(
                      height: 25,
                    ),
                    myTextField(hintText: "Password", icon: Icons.lock),
                  ],
                ),
              )),
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New User?",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Register now",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget myTextField({@required hintText, @required icon}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
