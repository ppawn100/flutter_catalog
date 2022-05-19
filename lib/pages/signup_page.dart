import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isAgreeState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Sign Up"
                    .text
                    .xl5
                    .bold
                    .color(context.theme.secondaryHeaderColor)
                    .make(),
                "Create your account".text.xl2.make(),
                CupertinoFormSection(
                    header: "Personal Details".text.make(),
                    children: [
                      CupertinoFormRow(
                        prefix: "Name".text.make(),
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Enter name",
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: "Phone".text.make(),
                        child: CupertinoTextFormFieldRow(
                          placeholder: "Enter phone",
                        ),
                      )
                    ]),
                CupertinoFormSection(header: "User".text.make(), children: [
                  CupertinoFormRow(
                    prefix: "Email".text.make(),
                    child: CupertinoTextFormFieldRow(
                      placeholder: "Enter email",
                    ),
                  ),
                  CupertinoFormRow(
                    prefix: "Password".text.make(),
                    child: CupertinoTextFormFieldRow(
                      obscureText: true,
                    ),
                  ),
                  CupertinoFormRow(
                    prefix: "Confirm Password".text.make(),
                    child: CupertinoTextFormFieldRow(
                      obscureText: true,
                    ),
                  )
                ]),
                CupertinoFormSection(
                    header: "Terms & Conditions".text.make(),
                    children: [
                      CupertinoFormRow(
                        prefix: "I Agree".text.make(),
                        child: CupertinoSwitch(
                          value: isAgreeState,
                          activeColor: CupertinoColors.activeOrange,
                          onChanged: (value) {
                            isAgreeState = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ]),
                20.heightBox,
                Material(
                  color: context.theme.secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ).centered(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
