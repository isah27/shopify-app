// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:shopify/class/model/models.dart';

@immutable
abstract class ShopifyState extends Equatable {
  const ShopifyState();
}

class InitialState extends ShopifyState {
  @override
  List<Object?> get props => [];
}

// class LoginState extends ShopifyState {
//   @override
//   List<Object?> get props => [];
// }

class LoginLoadingState extends ShopifyState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends ShopifyState {
    final List<Product> data;
  const AuthenticatedState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

}

class LoadingState extends ShopifyState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ShopifyState {
  final List<Product> data;
  const LoadedState({required this.data});
  @override
  List<Object?> get props => [data];
}

class ErrorsState extends ShopifyState {
  final String error;
  const ErrorsState({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}


@immutable
abstract class DataState extends Equatable {
  const DataState();
}

class DataLoadingState extends DataState {
  @override
  List<Object?> get props => [];
}

class DataLoadedState extends DataState {
  final List<Product> datas;
  const DataLoadedState({required this.datas});
  @override
  List<Object?> get props => [datas];
}

class DataErrorsState extends DataState {
  final String error;
  const DataErrorsState({
    required this.error,
  });
  @override
  List<Object?> get props => [];
}
