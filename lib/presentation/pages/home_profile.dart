import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/user_avatar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<CurrentUser>().value;
    return Stack(alignment: Alignment.topCenter, children: [
      Padding(
        padding: const EdgeInsets.only(top: 96),
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 176),
          padding: const EdgeInsets.only(top: 56),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: AppColors.gradient1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          width: double.infinity,
          child: Column(children: [
            Text(user?.displayName ?? "",
                style: MainStyles.titleMedium(context,
                    color: AppColors.lightOnPrimary)),
            Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 32),
                child: Consumer<UserAccount>(
                  builder: (_, userAccount, __) => Text(
                      "Account Number -  ${userAccount.acctNumber}",
                      style: MainStyles.titleMedium(context,
                          color: AppColors.lightOnPrimary)),
                )),
          ]),
        ),
      ),
      ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 112),
          child: Center(
            child: Stack(alignment: Alignment.bottomRight, children: [
              UserAvatar(user, radius: 43.5),
              SizedBox.fromSize(
                  size: const Size.square(32),
                  child: ElevatedButton(
                    onPressed: () {
                      /* TODO */
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.lightOnPrimary,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24)))),
                    child: const Icon(IconsaxBold.edit_2, size: 20),
                  ))
            ]),
          ),
        ),
        Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 327),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            TextButton(
              onPressed: () {},
              style: MainStyles.whiteListButton(context, top: true),
              child: Text("Set Financial Goals",
                  style:
                      MainStyles.titleMedium(context, color: AppColors.black)),
            ),
            const Divider(height: 1, color: AppColors.neutral87),
            TextButton(
              onPressed: () {},
              style: MainStyles.whiteListButton(context),
              child: Text("Change Transaction Pin",
                  style:
                      MainStyles.titleMedium(context, color: AppColors.black)),
            ),
            const Divider(height: 1, color: AppColors.neutral87),
            TextButton(
              onPressed: () {},
              style: MainStyles.whiteListButton(context, bottom: true),
              child: Text("Change Log In Pin",
                  style:
                      MainStyles.titleMedium(context, color: AppColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    "My Socials",
                    style: MainStyles.titleMedium(context),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: AppColors.lightSurfaceVariant,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        /* TODO */
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.zero),
                      child: Image.asset(
                        "public/images/whatsapp.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        /* TODO */
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.zero),
                      child: Image.asset(
                        "public/images/whatsapp.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        /* TODO */
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.zero),
                      child: Image.asset(
                        "public/images/whatsapp.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ]),
            )
          ]),
        )
      ]),
      Positioned(
        top: 24,
        right: 24,
        child: Stack(alignment: Alignment.topRight, children: [
          SizedBox.fromSize(
              size: const Size.square(32),
              child: TextButton(
                onPressed: () {
                  /* TODO */
                },
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    padding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)))),
                child: const Icon(IconsaxBold.setting_2, size: 24),
              ))
        ]),
      ),
    ]);
  }
}
