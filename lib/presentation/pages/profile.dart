import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/user_avatar.dart';
import 'package:provider/provider.dart';
import 'package:paywave/data/state/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // User? user = context.watch<CurrentUser>().value;
    var user = Provider.of<UserProvider>(context, listen: false).userModel;
    return ListView(shrinkWrap: true, children: [
      Stack(alignment: Alignment.topCenter, children: [
        Padding(
          padding: const EdgeInsets.only(top: 96),
          child: Container(
              height: 224,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 176),
              padding: const EdgeInsets.only(top: 56, right: 24, left: 24),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.gradient1),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              width: double.infinity,
              child: Column(
                children: [
                  Text(user?.name ?? "",
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
                  ElevatedButton(
                    onPressed: () {},
                    style: MainStyles.whiteListButton(context, top: true),
                    child: Text("Set Financial Goals",
                        style: MainStyles.titleMedium(context,
                            color: AppColors.black)),
                  ),
                  const Divider(height: 1, color: AppColors.neutral87),
                  ElevatedButton(
                    onPressed: () {},
                    style: MainStyles.whiteListButton(context),
                    child: Text("Change Transaction Pin",
                        style: MainStyles.titleMedium(context,
                            color: AppColors.black)),
                  ),
                  const Divider(height: 1, color: AppColors.neutral87),
                  ElevatedButton(
                    onPressed: () {},
                    style: MainStyles.whiteListButton(context, bottom: true),
                    child: Text("Change Log In Pin",
                        style: MainStyles.titleMedium(context,
                            color: AppColors.black)),
                  ),
                ],
              )),
        ),
        Positioned(
          top: 48,
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
                          borderRadius: BorderRadius.all(Radius.circular(24)))),
                  child: const Icon(IconsaxBold.edit_2, size: 20),
                ))
          ]),
        ),
      ])
    ]);
  }
}
