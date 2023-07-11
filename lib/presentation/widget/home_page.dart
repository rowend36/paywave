import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/presentation/widget/home_top_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: const [HomeTopWidget()]);
  }
}

const homeRoute = AppRoute(
    name: "Home",
    icon: IconsaxOutline.home_hashtag,
    iconActive: IconsaxBold.home_hashtag,
    page: HomePage());
