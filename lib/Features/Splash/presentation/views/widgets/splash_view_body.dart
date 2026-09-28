import 'package:bookly_app/Features/Home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidenAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigatToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsDate.logo,
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 5),
        SlidingText(slidenAnimation: slidenAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    slidenAnimation = Tween(
      begin: Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigatToHome() {
    Future.delayed(Duration(seconds: 6), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fade,
        duration: kTransetionDurtion,
      );
    });
  }
}
