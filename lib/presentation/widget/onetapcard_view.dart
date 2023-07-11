import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class OneTapCard extends StatelessWidget {
  const OneTapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        height: 262,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            color: AppColors.darkOnPrimary,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Stack(
          children: [
            const Positioned(
                top: 24,
                left: 16,
                child: Image(
                    image:
                        AssetImage("lib/assets/home_logo_without_text.png"))),
            const Positioned(
                right: 0,
                child: Image(
                    image: AssetImage("lib/assets/home_card_circle_1.png"))),
            Positioned(
              top: 80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: AppColors.lightPrimaryContainer)),
                      Text("10-4030-011094",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: AppColors.lightPrimaryContainer))
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ColoredBox(
                color: AppColors.primary10,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Row(children: [
                    Column(children: [
                      Text("Card Holder's Name"),
                      Text("Noman Manzoor")
                    ]),
                    Column(children: [Text("Expire Date"), Text("10/28/24")])
                  ]),
                ),
              ),
            )
          ],
        ));
  }
}
