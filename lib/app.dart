import 'package:flutter/material.dart';

import 'config/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.black,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: Routes.list,
      initialRoute: Routes
          .authCheck, //* Página intermediária/ou/widget para verificar se o usuário tá logado
      navigatorKey: Routes.navigatorKey,
      //initialRoute: "/",
      // routes: {
      //   "/": (_) => const AppView(),
      //   "/app_view": (_) => const AppView(),

      // },
    );
  }
}
