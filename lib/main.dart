import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify/class/bloc/app_bloc.dart';
import 'package:shopify/class/model/models.dart';
import 'package:shopify/class/repository/repository.dart';
import 'package:shopify/class/route/route.dart';
import 'package:shopify/pages/authentication/login.dart';
import 'package:shopify/pages/main_screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRoute _appRoute = AppRoute();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ShopifyBloc(ShopifyRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            // primarySwatch: Colors.amber,
            ),
    
        onGenerateRoute: _appRoute.onGeneratedRoute,
      ),
    );
  }
}
