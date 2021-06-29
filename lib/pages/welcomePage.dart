import 'package:flutter/material.dart';
import 'package:food_delivery/pages/signup_page.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SizedBox(
                height: 100,
                width: 100,
                child: FlutterLogo(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome To Testee",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Order food from our restaueant and"),
                        Text("Make reservation in real-time.")
                      ],
                    ),
                    button(
                      name: "Login",
                      bgColor: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                    button(
                      name: "SignUp",
                      bgColor: Colors.white,
                      textColor: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget button(
      {@required name,
      @required bgColor,
      @required textColor,
      @required onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            name,
            style: TextStyle(color: textColor),
          ),
          onPressed: onPressed,
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.green,
                width: 2,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              bgColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
