import 'package:ec_app/application/core/splashscreen/splashscreen.dart';
import 'package:ec_app/application/features/details/provider/deatiles_provider.dart';
import 'package:ec_app/application/features/success_page/provider/success_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'application/features/home_pg/provider/homescn_provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenPvdr>(create: (_) => HomeScreenPvdr()),
        ChangeNotifierProvider<DeatilesProvider>(create: (_) => DeatilesProvider()),
        ChangeNotifierProvider(create: (context) => SuccesssProvider(),)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:const ScreenSplash()),
    );
  }
}
