import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  RegExp regExp = RegExp(SignUpPage.pattern.toString());

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void clearField() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
  }

  void validation() {
    if (firstName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "First name is Required !",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 500),
      ));
    }
    if (lastName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Last name is Required !",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 500),
      ));
    }
    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Email name is Required !",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 500),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Please enter valid Email",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 500),
      ));
      return;
    }
    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Password name is Required !",
          style: TextStyle(color: Colors.red),
        ),
        duration: Duration(milliseconds: 500),
      ));
    }
  }

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
                  myTextField(
                      hintText: "First Name",
                      icon: Icons.person,
                      controller: firstName),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(
                      hintText: "Last Name",
                      icon: Icons.person,
                      controller: lastName),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(
                      hintText: "Email", icon: Icons.mail, controller: email),
                  SizedBox(
                    height: 15,
                  ),
                  myTextField(
                      hintText: "Password",
                      icon: Icons.lock,
                      obscure: true,
                      controller: password),
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
                    onPressed: () {
                      clearField();
                    },
                    buttonColor: Colors.white,
                    buttonName: "Cancle",
                    textColor: Colors.black,
                  ),
                  myButton(
                    onPressed: () {
                      validation();
                    },
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
      {@required buttonColor,
      @required buttonName,
      @required textColor,
      @required onPressed}) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget myTextField(
      {@required hintText, @required icon, @required controller, obscure}) {
    return TextFormField(
      controller: controller,
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
