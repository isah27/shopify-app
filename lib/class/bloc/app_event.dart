// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:shopify/class/model/models.dart';

@immutable
abstract class ShopifyEvent extends Equatable {
  const ShopifyEvent();
}

class LoginEvent extends ShopifyEvent {
  String email;
  String password;
  BuildContext context;
  LoginEvent({
    required this.email,
    required this.password,
    required this.context,
  });
  @override
  List<Object?> get props => [email, password];
}

class FetchDataEvent extends ShopifyEvent {
  @override
  List<Object?> get props => [];
}
