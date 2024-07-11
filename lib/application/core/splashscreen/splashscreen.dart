import 'package:ec_app/application/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../navigation_bar/navbar.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    // controller.repeat();
    controller.forward();

    changeScreen();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  changeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    //using Getx
    // Get.to(() => const ScreenLogin());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BottomNavBar(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientAppBarColordown,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.network(
              "https://media.licdn.com/dms/image/D560BAQF0MprElr7V5Q/company-logo_200_200/0/1704436622468/hutechsolutions_logo?e=2147483647&v=beta&t=sIoZxjyfFcAk7MP8vLQ-dzIMTNYfnx2kpp7Cg6icKUw"),
        ),
      ),
    );
  }
}
