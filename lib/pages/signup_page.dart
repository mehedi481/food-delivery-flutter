import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late UserCredential userCredential;
  bool isLoading = false;

  RegExp regExp = RegExp(SignUpPage.pattern.toString());

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future sendData() async {
    print("sendData function is called");
    try {
      //Create User
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      //Store User Data
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstName.text
            .trim(), //TODO: use trim() to avoid white space leading and trailing
        'lastName': lastName.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
        'userId': userCredential.user!.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
      print("isloading false");
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Account Create Successfully"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    clearField();
                    Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        ModalRoute.withName("/"));
                  },
                  color: Colors.blue,
                  child: Text(
                    "Log in Now",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          });
    });
  }

  void clearField() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
  }

  //TODO: use trim() to avoid white space leading and trailing
  void validation() {
    if (firstName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "First name is Required !",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    }
    if (lastName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Last name is Required !",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    }
    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email name is Required !",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter valid Email",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    }
    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password name is Required !",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else {
      setState(() {
        isLoading = true;
        print("isloading true");
      });
      sendData();
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
              child: isLoading == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    )
                  : Row(
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
