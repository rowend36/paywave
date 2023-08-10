import 'package:flutter/material.dart';
import 'package:paywave/data/models/user.dart';
import 'package:paywave/presentation/screens/main/main_styles.dart';
import 'package:paywave/presentation/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final User? user;
  final double radius;
  const UserAvatar(this.user, {super.key, this.radius = 19.5});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.neutral50,
        backgroundImage:
            user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
        child: user?.photoURL != null
            ? null
            : Text(user?.initials ?? "",
                style: MainStyles.titleLarge(context, color: AppColors.white)));
  }
}
