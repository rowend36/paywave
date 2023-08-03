import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class OneTapCard extends StatelessWidget {
  const OneTapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        height: 232,
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
                    image: AssetImage(
                        "public/images/home_logo_without_text.png"))),
            const Positioned(
                right: 0,
                child: Image(
                    image: AssetImage("public/images/home_card_circle_1.png"))),
            const Positioned(
                left: 0,
                bottom: 0,
                child: Image(
                    image: AssetImage("public/images/home_card_circle_2.png"))),
            Positioned(
              top: 80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "ID",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: AppColors.lightPrimaryContainer,
                                    fontSize: 11,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    height: 1.45,
                                    /* 145.455% */
                                    letterSpacing: 0.5),
                          )),
                      Text(
                        "10-4030-011094",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppColors.lightPrimaryContainer,
                              fontSize: 28,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              height: 1.286, /* 128.571% */
                            ),
                      )
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ColoredBox(
                color: AppColors.primary10,
                child: Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  height: 75,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "Card Holder's Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color:
                                              AppColors.lightPrimaryContainer,
                                          fontSize: 11,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.45,
                                          letterSpacing: 0.5),
                                ),
                              ),
                              Text("Noman Manzoor",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color:
                                              AppColors.lightPrimaryContainer,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          letterSpacing: 0.15))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "Expire Date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color:
                                              AppColors.lightPrimaryContainer,
                                          fontSize: 11,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.45,
                                          letterSpacing: 0.5),
                                ),
                              ),
                              Text("10/28/24",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color:
                                              AppColors.lightPrimaryContainer,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          letterSpacing: 0.15))
                            ])
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}
