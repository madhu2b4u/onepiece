import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onepiece/auth/screen/LoginScreen.dart';
import 'package:onepiece/home/screen/HomeScreen.dart';
import 'package:onepiece/splash_screen.dart';
import 'package:onepiece/unknown_route_page.dart';
import 'package:onepiece/utils/Constants.dart';


void main()  async {
await GetStorage.init();
runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Conch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const UnknownRoutePage(),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        /*GetPage(
          name: '/obxDemoPage',
          page: () => ObxDemoPage(),
        ),
        GetPage(
          name: '/translationDemoPage',
          page: () => const TranslationDemoPage(),
        ),
        GetPage(
          name: '/showDataReceivedDataPage',
          page: () => const ShowDataReceivedDataPage(),
        ),
        GetPage(
          name: '/sendDataPage',
          page: () => SendDataPage(),
        ),
        GetPage(
          name: '/postsPage',
          page: () => const PostsPage(),
          binding: PostBinding(),
        )*/
      ],
    );
  }
}
