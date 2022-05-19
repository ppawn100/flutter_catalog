import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:flutter_catalog/pages/signup_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

import './pages/home_page.dart';
import './pages/login_page.dart';
import '../pages/cart_page.dart';
import './utils/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(
    store: MyStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vxNavigator = VxNavigator(routes: {
      "/": (_, __) => const MaterialPage(child: LoginPage()),
      AppRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
      AppRoutes.homeDetailRoute: (uri, _) {
        final catalog = (VxState.store as MyStore)
            .catalog
            .getById(int.parse(uri.queryParameters["id"].toString()));
        return MaterialPage(
            child: HomeDetailPage(
          catalog: catalog,
        ));
      },
      AppRoutes.loginRoute: (_, __) => const MaterialPage(child: LoginPage()),
      AppRoutes.signupRoute: (_, __) => const MaterialPage(child: SignUpPage()),
      AppRoutes.cartRoute: (_, __) => const MaterialPage(child: CartPage()),
    });
    (VxState.store as MyStore).navigator = vxNavigator;

    return MaterialApp.router(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: vxNavigator,
      // initialRoute: AppRoutes.homeRoute,
      // routes: {
      //   "/": (context) => const LoginPage(),
      //   AppRoutes.loginRoute: (context) => const LoginPage(),
      //   AppRoutes.homeRoute: (context) => const HomePage(),
      //   AppRoutes.cartRoute: (context) => const CartPage(),
      // },
    );
  }
}
