import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/data/models/app_route.dart';
import 'package:paywave/data/models/transactions.dart';
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
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                /** TODO */
              },
              style: MainStyles.listButton(context),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                  const Icon(IconsaxOutline.arrow_right_3,
                      color: AppColors.black)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                /** TODO */
              },
              style: MainStyles.listButton(context),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: AppColors.lightPrimaryContainer),
                    child: const Icon(
                        size: 18,
                        IconsaxBold.shopping_cart,
                        color: AppColors.primary),
                  ),
                  Text("Shopping checkout",
                      style: MainStyles.labelLarge(context)),
                  const Spacer(),
                  const Icon(IconsaxOutline.arrow_right_3,
                      color: AppColors.black)
                ],
              ),
            ),
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

const homeRoute = AppRoute(
    name: "Home",
    icon: IconsaxOutline.home_hashtag,
    iconActive: IconsaxBold.home_hashtag,
    page: HomePage());
