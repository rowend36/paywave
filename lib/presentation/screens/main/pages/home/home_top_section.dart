import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/presentation/screens/main/main_screen.dart';
import 'package:paywave/presentation/screens/main/pages/card/card_page.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/onetap_card.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/state/user.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/widget/user_avatar.dart';
import 'package:provider/provider.dart';

class HomeTopSection extends StatefulWidget {
  const HomeTopSection({super.key});

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  bool showBalance = false;
  _toggleShowBalance() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  _gotoCardPage() {
    // currentRoute.value = cardRoute;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var user = Provider.of<UserProvider>(context, listen: false).userModel;
    return Container(
      height: 264,
      padding: const EdgeInsets.only(top: 56, right: 24, left: 24),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradient1),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Consumer<User>(
          builder: (_, currentUser, __) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi ${user!.name ?? ''}",
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.darkPrimaryFixedDim,
                    fontSize: 32,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                ),
                // UserAvatar(currentUser.value)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text("Your Account Balance is",
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.lightPrimaryContainer,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                height: 1.5,
                leadingDistribution: TextLeadingDistribution.even,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Consumer<UserAccount>(
              builder: (_, userAccount, __) =>
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text("\$",
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppColors.lightOnPrimary,
                          fontSize: 32,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          leadingDistribution: TextLeadingDistribution.even,
                        )),
                    ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 120),
                        child: Transform.translate(
                            offset: Offset(0, showBalance ? 0 : 5),
                            child: Text(
                                "${showBalance ? userAccount.acctBalance : " *****"}",
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppColors.lightOnPrimary,
                                  fontSize: 32,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                )))),
                    IconButton(
                        onPressed: _toggleShowBalance,
                        color: AppColors.lightOnPrimary,
                        icon: Icon(showBalance
                            ? IconsaxBold.eye_slash
                            : IconsaxBold.eye))
                  ])),
        ),
        // This is how you clip in Flutter
        Flexible(
          child: ClipRect(
            // clipBehavior: Clip.none,
            child: OverflowBox(
              maxHeight: double.infinity,
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const OneTapCard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: _gotoCardPage,
                          color: AppColors.lightOnPrimary,
                          icon: const Icon(IconsaxOutline.arrow_up_2))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
