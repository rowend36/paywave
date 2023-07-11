import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import './onetapcard_view.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:provider/provider.dart';

class HomeTopWidget extends StatefulWidget {
  const HomeTopWidget({super.key});

  @override
  State<HomeTopWidget> createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
  bool showBalance = false;
  _toggleShowBalance() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 264,
      padding: const EdgeInsets.only(top: 56, right: 24, left: 24),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradient1),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Consumer<CurrentUser>(
          builder: (_, currentUser, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hi ${currentUser.value?.name ?? 'Lee'}",
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.darkPrimaryFixedDim,
                  )),
              CircleAvatar(
                  backgroundColor: const Color(0xFFD9D9D9),
                  backgroundImage: currentUser.value?.photoURL != null
                      ? NetworkImage(currentUser.value!.photoURL)
                      : null,
                  child: currentUser.value?.photoURL != null
                      ? null
                      : Text(currentUser.value?.initials ?? ""))
            ],
          ),
        ),
        Text("Your Account Balance is",
            style: textTheme.bodyLarge
                ?.copyWith(color: AppColors.lightPrimaryContainer)),
        Consumer<UserAccount>(
            builder: (_, userAccount, __) => Row(children: [
                  ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 120),
                      child: Text(
                        "\$${showBalance ? userAccount.acctBalance : "******"}",
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppColors.lightOnPrimary,
                        ),
                      )),
                  IconButton(
                      onPressed: _toggleShowBalance,
                      color: AppColors.lightOnPrimary,
                      icon: Icon(showBalance
                          ? IconsaxBold.eye_slash
                          : IconsaxBold.eye))
                ])),
        // This is how you clip in Flutter
        const Flexible(
          child: ClipRect(
            clipBehavior: Clip.none,
            child: OverflowBox(
              maxHeight: double.infinity,
              alignment: Alignment.topCenter,
              child: OneTapCard(),
            ),
          ),
        )
      ]),
    );
  }
}
