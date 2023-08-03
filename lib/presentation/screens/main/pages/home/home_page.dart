import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/presentation/screens/main/pages/home/home_top_widget.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  _sendFunds() {
    // AlertDialog()
  }
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      const HomeTopWidget(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _sendFunds,
                    style: MainStyles.outlinedButton1(context),
                    icon: const Icon(IconsaxBold.send_2),
                    label: const Text("Send Money"),
                  ),
                  OutlinedButton.icon(
                      onPressed: () => _sendFunds,
                      style: MainStyles.outlinedButton1(context),
                      icon: const Icon(IconsaxBold.money_recive),
                      label: const Text("Fund Card"))
                ]),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  /** TODO */
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 18),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: AppColors.white),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: AppColors.lightPrimaryContainer),
                          child: const Icon(
                              size: 18,
                              IconsaxOutline.driving,
                              color: AppColors.primary),
                        ),
                        Text("Pay for transportation",
                            style: MainStyles.labelLarge(context)),
                        const Spacer(),
                        const Icon(IconsaxOutline.arrow_right_3)
                      ],
                    )),
              )),
        ]),
      )
    ]);
  }
}

const homeRoute = AppRoute(
    name: "Home",
    icon: IconsaxOutline.home_hashtag,
    iconActive: IconsaxBold.home_hashtag,
    page: HomePage());
