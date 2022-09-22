import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText,
      required this.controller,
      required this.validator,
      required this.icon,
      this.isObscure = false,
      this.isSearch = false,
      Key? key})
      : super(key: key);
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validator(value);
      },
      onSaved: (value) {
        controller.text = value!;
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        label: isSearch
            ? null
            : Text(
                hintText,
                style: TextStyle(color: Colors.grey),
              ),
        prefixIcon: Icon(icon, color: Colors.grey),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        // border: UnderlineInputBorder(
        //   // borderSide: BorderSide(
        //   //   color: Colors.red,
        //   //   width: 2,
        //   //   style: BorderStyle.solid,
        //   // ),
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
    );
  }
}
