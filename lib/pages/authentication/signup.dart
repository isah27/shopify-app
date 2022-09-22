import 'package:flutter/material.dart';
import 'package:shopify/class/validator/validator.dart';
import 'package:shopify/widgets/button.dart';
import 'package:shopify/widgets/drop_down.dart';
import 'package:shopify/widgets/normal_text.dart';
import 'package:shopify/widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //form key
  final _formKey = GlobalKey<FormState>();
  String gender = "Male";
  // calling validator class
  Validator validator = Validator();
  // editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.amber.shade900,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.amber.shade900,
                Colors.black.withOpacity(0.2),
              ],
              stops: const [
                0.4,
                0.9,
              ]),
        ),
        child: Stack(
          children: [
            // navigate back icon button
            Positioned(
              top: 35,
              //bottom: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            // Text
            Positioned(
              top: 50,
              right: 30,
              left: 30,
              //bottom: 0,
              child: Center(
                child: NormalText(
                  text: "Create new account",
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            // form
            Positioned(
              top: 80,
              left: 5,
              right: 5,
              bottom: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                            hintText: "Full Name",
                            controller: nameController,
                            validator: (value) =>
                                validator.nameValidator(value),
                            icon: Icons.person),
                        const SizedBox(height: 15),
                        CustomTextField(
                            hintText: "Email",
                            controller: emailController,
                            validator: (value) =>
                                validator.emailValidation(value),
                            icon: Icons.email),
                        const SizedBox(height: 15),
                        CustomTextField(
                            hintText: "Mobile Number",
                            controller: phoneNumberController,
                            validator: (value) =>
                                validator.emptyValidator(value),
                            icon: Icons.add_call),
                        const SizedBox(height: 15),
                        CustomTextField(
                            hintText: "Home Address",
                            controller: addressController,
                            validator: (value) =>
                                validator.emptyValidator(value),
                            icon: Icons.home),
                        const SizedBox(height: 15),
                        AppDropdownInput(
                          hintText: "Gender",
                          options: const ["Male", "Female"],
                          value: gender,
                          onChanged: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                          getLabel: (String value) => value,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                            hintText: "Password",
                            isObscure: true,
                            controller: passwordController,
                            validator: (value) =>
                                validator.passwordValidation(value),
                            icon: Icons.lock),
                        const SizedBox(height: 15),
                        CustomTextField(
                            hintText: "Confirm Password",
                            isObscure: true,
                            controller: confirmPasswordController,
                            validator: (value) => validator.passwordValidation(
                                value,
                                isConfirm: true,
                                textEditingController: passwordController),
                            icon: Icons.lock),
                        const SizedBox(height: 15),
                        CustomButton(
                            text: "Register",
                            onPressed: () {
                              print("registered");
                            }),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 7,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    text: "Already have an account?",
                    // color: ,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: (() {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    }),
                    child: NormalText(
                      text: "Login",
                      size: 18,
                      isbBold: true,
                      color: Colors.amber.shade900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
