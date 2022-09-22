import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/class/bloc/app_bloc.dart';
import 'package:shopify/class/bloc/app_event.dart';
import 'package:shopify/class/bloc/app_state.dart';
import 'package:shopify/class/repository/repository.dart';
import 'package:shopify/class/validator/validator.dart';
import 'package:shopify/pages/authentication/signup.dart';
import 'package:shopify/pages/main_screens/home.dart';
import 'package:shopify/widgets/button.dart';
import 'package:shopify/widgets/normal_text.dart';
import 'package:shopify/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final _formKey = GlobalKey<FormState>();
  final Validator _validator = Validator();
  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ShopifyBloc>(context, listen: true),
      // create: (context) => ShopifyBloc(
      //   RepositoryProvider.of<ShopifyRepository>(context),
      // ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<ShopifyBloc, ShopifyState>(
              listener: (context, state) {
            if (state is AuthenticatedState) {
              context.read<ShopifyBloc>().add(FetchDataEvent());
            } else if (state is LoadingState) {
              print("Loading");
              Navigator.of(context).push<HomePage>(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else if (state is ErrorsState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }, builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 350,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 100, bottom: 100),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade900,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      child: FittedBox(
                        child: Text(
                          "SHOPIFY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      5, 4), // changes position of shadow
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 370,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                CustomTextField(
                                  hintText: "Email",
                                  controller: emailController,
                                  validator: (value) =>
                                      _validator.emailValidation(value),
                                  icon: Icons.email,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  hintText: "Password",
                                  isObscure: true,
                                  controller: passwordController,
                                  validator: (value) =>
                                      _validator.passwordValidation(
                                    value,
                                    isConfirm: false,
                                  ),
                                  icon: Icons.lock,
                                ),
                                const SizedBox(height: 5),
                                // Error Text
                                NormalText(
                                    text:
                                        state is ErrorsState ? state.error : "",
                                    size: 12,
                                    color: Colors.red),
                                const SizedBox(
                                  height: 35,
                                ),
                                CustomButton(
                                    text: "Login",
                                    onPressed: () {
                                      _formKey.currentState!.validate();
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        BlocProvider.of<ShopifyBloc>(context)
                                            .add(
                                          LoginEvent(
                                            context: context,
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          ),
                                        );
                                      }
                                    }),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("Don't have an account?",
                                  style: TextStyle(color: Colors.black)),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.amber.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // Blur
                  state is LoginLoadingState
                      ? Positioned.fill(
                          child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3.0,
                            sigmaY: 3.0,
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: const Center(
                                child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.red,
                            )),
                          ),
                        ))
                      : Container(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
