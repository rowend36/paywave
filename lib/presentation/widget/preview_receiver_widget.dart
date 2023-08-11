import 'package:flutter/material.dart';
import 'package:paywave/data/models/user_account.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';
import 'package:paywave/presentation/widget/user_avatar.dart';

class PreviewReceiverWidget extends StatelessWidget {
  final UserAccount receiver;
  const PreviewReceiverWidget(this.receiver, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Receipient",
            style: MainStyles.titleMedium(context, color: AppColors.black)),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 32),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: ShapeDecoration(
                color: AppColors.lightPrimaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: Column(
              children: [
                UserAvatar(receiver.user, radius: 19.25),
                Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Text(receiver.user?.name,
                        style: MainStyles.bodyMedium(context,
                            color: AppColors.neutral24))),
                Text("Account Number - ${receiver.acctNumber}",
                    style: MainStyles.bodyMedium(context,
                        color: AppColors.neutral24))
              ],
            ),
          ),
        )
      ],
    );
  }
}
