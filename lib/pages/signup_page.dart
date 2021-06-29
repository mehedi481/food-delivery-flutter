import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myTextField(hintText: "First Name", icon: Icons.person),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(hintText: "Last Name", icon: Icons.person),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(hintText: "Email", icon: Icons.mail),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(hintText: "Password", icon: Icons.lock,obscure: true),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton(
                    buttonColor: Colors.white,
                    buttonName: "Cancle",
                    textColor: Colors.black,
                  ),
                  myButton(
                    buttonColor: Colors.red,
                    buttonName: "Register",
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget myButton(
      {@required buttonColor, @required buttonName, @required textColor}) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          buttonName,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget myTextField({@required hintText, @required icon,obscure}) {
    return TextFormField(
      obscureText: obscure ?? false,
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
