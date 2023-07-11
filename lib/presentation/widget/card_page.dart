import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/app_route.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Card");
  }
}

const cardRoute = AppRoute(
    name: "Card",
    icon: IconsaxOutline.card_pos,
    iconActive: IconsaxBold.card_pos,
    page: CardPage());
