import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/page_data.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/data/state/account.dart';
import 'package:paywave/data/state/card.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/onetap_card.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  void _setCardActivation(bool value) {
    /* TODO - card activation */
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Stack(children: [
        Container(
          height: 224,
          padding: const EdgeInsets.only(top: 56, right: 24, left: 24),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: AppColors.gradient1),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 56, right: 24, left: 24, bottom: 240),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Your Card",
                      style: MainStyles.headlineLarge(context),
                    )),
                const Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 36),
                        child: OneTapCard())),
                ElevatedButton(
                  onPressed: () {},
                  style: MainStyles.whiteListButton(context, top: true),
                  child: Text("Instant Card Activate",
                      style: MainStyles.titleMedium(context,
                          color: AppColors.black)),
                ),
                const Divider(height: 1, color: AppColors.neutral87),
                ElevatedButton(
                  onPressed: () {},
                  style: MainStyles.whiteListButton(
                    context,
                  ),
                  child: Text("Set Pay Time",
                      style: MainStyles.titleMedium(context,
                          color: AppColors.black)),
                ),
                const Divider(height: 1, color: AppColors.neutral87),
                ElevatedButton(
                  onPressed: () {},
                  style: MainStyles.whiteListButton(
                    context,
                  ),
                  child: Text("Set Spending Limit",
                      style: MainStyles.titleMedium(context,
                          color: AppColors.black)),
                ),
                const Divider(height: 1, color: AppColors.neutral87),
                Consumer<CardProvider>(builder: (_, provider, __) {
                  var loaded = provider.cardModel != null;
                  var isActivated =
                      loaded ? provider.cardModel!.cardActivated : false;

                  return ElevatedButton(
                    onPressed: () {
                      if (loaded) {
                        _setCardActivation(!isActivated);
                      }
                    },
                    style: MainStyles.whiteListButton(context, bottom: true),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isActivated ? "Deactivate card" : "Activated",
                              style: MainStyles.titleMedium(context,
                                  color: AppColors.black)),
                          Switch(
                              value: isActivated,
                              activeColor: AppColors.primary,
                              onChanged: _setCardActivation)
                        ]),
                  );
                })
              ]),
        )
      ]),
    ]);
  }
}

const cardRoute = PageData(
    name: "Card",
    icon: IconsaxOutline.card_pos,
    iconActive: IconsaxBold.card_pos,
    page: CardPage());
