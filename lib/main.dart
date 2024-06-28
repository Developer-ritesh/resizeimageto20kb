import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:resizeimageto20kb/firebase_options.dart';
import 'package:resizeimageto20kb/responsive/desktop.dart';
import 'package:resizeimageto20kb/responsive/mobile.dart';
import 'package:resizeimageto20kb/routes/manage_routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteClass.home,
      getPages: RouteClass.routes,
      unknownRoute: GetPage(name: RouteClass.home, page: () => InitialPage()),
    );
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return MobileHome();
        } else {
          return DesktopHome();
        }
      },
    );
  }
}
