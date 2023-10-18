import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/page_data.dart';
import 'package:paywave/data/models/transactions.dart';
import 'package:paywave/presentation/bloc/logic/auth.dart';
import 'package:paywave/presentation/pages/send_funds.dart';
import 'package:paywave/presentation/screens/main/pages/home/home_top_section.dart';
import 'package:paywave/presentation/screens/main/widgets/transaction_item_widget.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void _sendFunds(BuildContext context) {
    showDialog(context: context, builder: (context) => const SendFunds());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      const HomeTopSection(),
      Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 128),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _sendFunds(context),
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
            padding: const EdgeInsets.only(
              top: 43,
              bottom: 32,
            ),
            child: Center(
                child: Container(
              constraints: const BoxConstraints(maxWidth: 360),
              padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 16),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("public/images/coming_soon.png")),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Container(
                padding: const EdgeInsets.all(18),
                color: AppColors.lightPrimaryContainer,
                child: Row(
                  /* TODO make it shine */
                  children: [
                    Icon(
                      IconsaxOutline.warning_2,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                    ),
                    Expanded(
                        child: Text(
                      "Airtime and Data wil be launched soon !!!",
                      style: MainStyles.titleMedium(context),
                    ))
                  ],
                ),
              ),
            )),
          ),
          Consumer<TransactionList>(
            builder: (context, provider, header) {
              if (provider.isLoading) {
                return Column(children: [
                  header as Widget,
                  const Center(
                    heightFactor: 2,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                ]);
              }
              if (provider.transactions.isEmpty) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 48),
                        child: Text("No Transaction activity",
                            style: MainStyles.titleLarge(context))),
                    Image.asset("public/images/11578-wallet.png")
                  ],
                );
              }
              return Column(
                children: [
                  header as Widget,
                  ...provider.transactions.map((e) =>
                      TransactionItemWidget(transaction: e, key: ObjectKey(e)))
                ],
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("Transaction History",
                        style: MainStyles.titleLarge(context)),
                    TextButton(
                        onPressed: () {
                          /**TODO */
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.lightOnPrimaryContainer,
                            alignment: Alignment.centerRight),
                        child: const Text("See All")),
                  ]),
            ),
          ),
        ]),
      )
    ]);
  }
}

const homeRoute = PageData(
    name: "Home",
    icon: IconsaxOutline.home_hashtag,
    iconActive: IconsaxBold.home_hashtag,
    page: HomePage());
