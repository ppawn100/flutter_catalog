import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  String password = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              "assets/images/hey.png",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $userName",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          userName = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can not be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter userName",
                        labelText: "UserName",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can not be empty";
                        } else if (value.length < 6) {
                          return "Pasword lenght should be atleast 6";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular((changeButton ? 50 : 8)),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    //   onPressed: () {
                    //     if (userName != "" && password != "") {
                    //       Navigator.pushNamed(context, AppRoutes.homeRoute);
                    //     }
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
